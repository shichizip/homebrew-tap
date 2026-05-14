# homebrew-shichizip

Homebrew tap for [ShichiZip](https://github.com/idawnlight/ShichiZip), the 7-Zip derivative intended for macOS.

> [!NOTE]
> If you only need the stable release of ShichiZip standard variant, you can install it directly from the Homebrew Cask repository without adding this tap. This tap provides additional casks for the ZS variant and nightly builds.

```sh
brew install --cask shichizip
```

## Install

### ShichiZip

```sh
brew tap shichizip/tap
brew install --cask shichizip
```

### ShichiZip ZS

```sh
brew tap shichizip/tap
brew install --cask shichizip-zs
```

### Nightly Builds

```sh
brew tap shichizip/tap
brew install --cask shichizip@nightly
brew install --cask shichizip-zs@nightly
```

## Updates

The ShichiZip repository publishes rendered casks to this tap. Stable casks track published GitHub releases, and nightly casks track selected successful `main` branch build artifacts.

The stable casks track both the regular `ShichiZip` app release assets and the `ShichiZipZS` variant:

- `ShichiZip-v<version>-arm64.zip`
- `ShichiZip-v<version>-x86_64.zip`
- `ShichiZipZS-v<version>-arm64.zip`
- `ShichiZipZS-v<version>-x86_64.zip`

Nightly casks use `nightly.link` URLs for GitHub Actions artifacts from the ShichiZip repository.

## Maintenance

The template and renderer live in this tap under `templates/` and `scripts/`. The ShichiZip workflows check out this tap, render updated casks in place, and push the resulting changes back here.
