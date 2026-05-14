#!/usr/bin/env python3
from __future__ import annotations

import argparse
import hashlib
import os
import re
import sys
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path


TAP_ROOT = Path(__file__).resolve().parents[1]
TEMPLATE_PATH = TAP_ROOT / "templates" / "cask.rb.jinja"
HOMEPAGE = "https://github.com/idawnlight/ShichiZip"
DEFAULT_REPOSITORY = "idawnlight/ShichiZip"


@dataclass(frozen=True)
class Variant:
    stable_token: str
    nightly_token: str
    asset_prefix: str
    name: str
    desc: str
    app: str
    stable_conflict: str
    nightly_conflict: str
    zap_trash: tuple[str, ...]


VARIANTS = (
    Variant(
        stable_token="shichizip",
        nightly_token="shichizip@nightly",
        asset_prefix="ShichiZip",
        name="ShichiZip",
        desc="7-Zip derivative GUI",
        app="ShichiZip.app",
        stable_conflict="shichizip@nightly",
        nightly_conflict="shichizip",
        zap_trash=(
            "~/Library/Application Scripts/ee.dawn.ShichiZip.OpenInShichiZipAction",
            "~/Library/Application Scripts/ee.dawn.ShichiZip.RevealInFileManagerAction",
            "~/Library/Application Scripts/ee.dawn.ShichiZip.SmartQuickExtractAction",
            "~/Library/Group Containers/VNM753Y3JX.ShichiZip",
            "~/Library/Preferences/ee.dawn.ShichiZip.plist",
        ),
    ),
    Variant(
        stable_token="shichizip-zs",
        nightly_token="shichizip-zs@nightly",
        asset_prefix="ShichiZipZS",
        name="ShichiZip ZS",
        desc="7-Zip derivative GUI based on mcmilk/7-Zip-zstd",
        app="ShichiZip ZS.app",
        stable_conflict="shichizip-zs@nightly",
        nightly_conflict="shichizip-zs",
        zap_trash=(
            "~/Library/Application Scripts/ee.dawn.ShichiZipZS.OpenInShichiZipAction",
            "~/Library/Application Scripts/ee.dawn.ShichiZipZS.RevealInFileManagerAction",
            "~/Library/Application Scripts/ee.dawn.ShichiZipZS.SmartQuickExtractAction",
            "~/Library/Group Containers/VNM753Y3JX.ShichiZipZS",
            "~/Library/Preferences/ee.dawn.ShichiZipZS.plist",
        ),
    ),
)


class HomebrewError(RuntimeError):
    pass


def main() -> None:
    parser = argparse.ArgumentParser(description="Render ShichiZip Homebrew casks.")
    parser.add_argument(
        "--repository",
        default=os.environ.get("GITHUB_REPOSITORY", DEFAULT_REPOSITORY),
        help="GitHub repository in owner/name form.",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=TAP_ROOT / "Casks",
        help="Directory that will receive rendered .rb files.",
    )
    subparsers = parser.add_subparsers(dest="command", required=True)

    stable_parser = subparsers.add_parser("stable", help="Render release casks.")
    stable_parser.add_argument(
        "--tag",
        required=True,
        help="Release tag to render, such as v0.2.0.",
    )
    stable_parser.add_argument(
        "--artifact-dir",
        type=Path,
        required=True,
        help="Directory containing downloaded GitHub release asset files.",
    )

    nightly_parser = subparsers.add_parser("nightly", help="Render nightly casks.")
    nightly_parser.add_argument("--run-id", required=True, help="GitHub Actions run id.")
    nightly_parser.add_argument("--commit", required=True, help="Commit SHA for the run.")
    nightly_parser.add_argument(
        "--tag",
        required=True,
        help="Version tag or marketing version to use for nightly casks, such as v0.2.0 or 0.2.0.",
    )
    nightly_parser.add_argument(
        "--artifact-dir",
        type=Path,
        required=True,
        help="Directory containing downloaded GitHub Actions artifact files.",
    )
    nightly_parser.add_argument(
        "--date",
        help="UTC date stamp for the cask version. Defaults to today as YYYYMMDD.",
    )

    args = parser.parse_args()

    try:
        if args.command == "stable":
            render_stable(args.repository, args.output_dir, args.tag, args.artifact_dir)
        elif args.command == "nightly":
            render_nightly(
                args.repository,
                args.output_dir,
                args.run_id,
                args.commit,
                args.artifact_dir,
                args.tag,
                args.date,
            )
        else:
            raise HomebrewError(f"unsupported command: {args.command}")
    except HomebrewError as error:
        print(f"error: {error}", file=sys.stderr)
        sys.exit(1)


def render_stable(repository: str, output_dir: Path, tag: str, artifact_dir: Path) -> None:
    version = version_from_tag(tag)
    if not artifact_dir.is_dir():
        raise HomebrewError(f"artifact directory does not exist: {artifact_dir}")

    for variant in VARIANTS:
        artifact_paths = {
            "arm64": find_artifact_file(artifact_dir, f"{variant.asset_prefix}-{tag}-arm64.zip"),
            "x86_64": find_artifact_file(artifact_dir, f"{variant.asset_prefix}-{tag}-x86_64.zip"),
        }

        render_cask(
            output_dir=output_dir,
            filename=f"{variant.stable_token}.rb",
            token=variant.stable_token,
            version=version,
            url=f"https://github.com/{repository}/releases/download/v#{{version}}/{variant.asset_prefix}-v#{{version}}-#{{arch}}.zip",
            arm_sha256=file_sha256(artifact_paths["arm64"]),
            intel_sha256=file_sha256(artifact_paths["x86_64"]),
            variant=variant,
            livecheck_block="  livecheck do\n    url :url\n    strategy :github_latest\n  end\n\n",
            conflicts_block=f"  conflicts_with cask: \"{variant.stable_conflict}\"\n\n",
        )


def render_nightly(
    repository: str,
    output_dir: Path,
    run_id: str,
    commit: str,
    artifact_dir: Path,
    tag: str,
    date: str | None,
) -> None:
    short_sha = commit[:7]
    if not re.fullmatch(r"[0-9a-fA-F]{7,}", commit):
        raise HomebrewError(f"invalid commit SHA: {commit}")

    date_stamp = date or datetime.now(timezone.utc).strftime("%Y%m%d")
    if not re.fullmatch(r"\d{8}", date_stamp):
        raise HomebrewError(f"invalid date stamp: {date_stamp}")
    if not artifact_dir.is_dir():
        raise HomebrewError(f"artifact directory does not exist: {artifact_dir}")

    marketing_version = version_from_tag(tag)
    version = f"{marketing_version}-nightly.{date_stamp}.{short_sha}"

    for variant in VARIANTS:
        artifact_paths = {
            "arm64": find_artifact_file(artifact_dir, f"{variant.asset_prefix}-{short_sha}-arm64.zip"),
            "x86_64": find_artifact_file(artifact_dir, f"{variant.asset_prefix}-{short_sha}-x86_64.zip"),
        }
        url = f"https://nightly.link/{repository}/actions/runs/{run_id}/{variant.asset_prefix}-{short_sha}-#{{arch}}.zip"

        render_cask(
            output_dir=output_dir,
            filename=f"{variant.nightly_token}.rb",
            token=variant.nightly_token,
            version=version,
            url=url,
            arm_sha256=file_sha256(artifact_paths["arm64"]),
            intel_sha256=file_sha256(artifact_paths["x86_64"]),
            variant=variant,
            livecheck_block="  livecheck do\n    skip \"Nightly builds track GitHub Actions artifacts\"\n  end\n\n",
            conflicts_block=f"  conflicts_with cask: \"{variant.nightly_conflict}\"\n\n",
        )


def render_cask(
    output_dir: Path,
    filename: str,
    token: str,
    version: str,
    url: str,
    arm_sha256: str,
    intel_sha256: str,
    variant: Variant,
    livecheck_block: str,
    conflicts_block: str,
) -> None:
    output_dir.mkdir(parents=True, exist_ok=True)
    values = {
        "token": ruby_escape(token),
        "version": ruby_escape(version),
        "arm_sha256": validate_sha256(arm_sha256),
        "intel_sha256": validate_sha256(intel_sha256),
        "url": ruby_escape(url),
        "name": ruby_escape(variant.name),
        "desc": ruby_escape(variant.desc),
        "homepage": HOMEPAGE,
        "app": ruby_escape(variant.app),
        "livecheck_block": livecheck_block,
        "conflicts_block": conflicts_block,
        "zap_trash": render_zap_trash(variant.zap_trash),
    }
    rendered = render_template(TEMPLATE_PATH.read_text(encoding="utf-8"), values)
    (output_dir / filename).write_text(rendered, encoding="utf-8")


def render_template(template: str, values: dict[str, str]) -> str:
    def replace(match: re.Match[str]) -> str:
        key = match.group(1)
        if key not in values:
            raise HomebrewError(f"template references unknown value {key}")
        return values[key]

    return re.sub(r"{{\s*([a-zA-Z_][a-zA-Z0-9_]*)\s*}}", replace, template)


def render_zap_trash(paths: tuple[str, ...]) -> str:
    return ",\n".join(f"    \"{ruby_escape(path)}\"" for path in paths) + ","


def version_from_tag(tag: str) -> str:
    version = tag.removeprefix("v")
    if not re.fullmatch(r"\d+(?:\.\d+){1,3}(?:[-+][0-9A-Za-z.-]+)?", version):
        raise HomebrewError(f"invalid version tag: {tag}")
    return version


def find_artifact_file(artifact_dir: Path, artifact_name: str) -> Path:
    matches = [path for path in artifact_dir.rglob(artifact_name) if path.is_file()]
    if not matches:
        found = ", ".join(sorted(path.name for path in artifact_dir.rglob("*") if path.is_file())) or "none"
        raise HomebrewError(f"missing downloaded artifact file {artifact_name}; found: {found}")
    if len(matches) > 1:
        paths = ", ".join(str(path) for path in matches)
        raise HomebrewError(f"downloaded artifact file {artifact_name} is ambiguous: {paths}")
    return matches[0]


def file_sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as file:
        while True:
            chunk = file.read(1024 * 1024)
            if not chunk:
                break
            digest.update(chunk)
    return digest.hexdigest()


def validate_sha256(value: str) -> str:
    if not re.fullmatch(r"[a-fA-F0-9]{64}", value):
        raise HomebrewError(f"invalid sha256: {value}")
    return value.lower()


def ruby_escape(value: str) -> str:
    return value.replace("\\", "\\\\").replace('"', '\\"')


if __name__ == "__main__":
    main()
