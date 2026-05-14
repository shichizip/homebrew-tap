# homebrew-shichizip

Unofficial Homebrew tap for [ShichiZip](https://github.com/idawnlight/ShichiZip), the 7-Zip derivative intended for macOS.

## Install

### ShichiZip (Standard)

```sh
brew tap ChiahongHong/shichizip
# brew tap <owner>/shichizip
brew install --cask shichizip
```

### ShichiZip ZS (Zstandard Support)

Well, this tap is modified from the upstream to track the `ShichiZipZS` variant with Zstandard support, so you can install it directly:

```sh
brew tap szw0407/shichizip-zs
brew install --cask shichizip-zs
```

## Updates

This tap checks the latest upstream ShichiZip release once per day at 00:30 UTC using GitHub Actions.

The updater tracks both the regular `ShichiZip` app release assets and the `ShichiZipZS` variant:

- `ShichiZip-v<version>-arm64.zip`
- `ShichiZip-v<version>-x86_64.zip`
- `ShichiZipZS-v<version>-arm64.zip`
- `ShichiZipZS-v<version>-x86_64.zip`

It does not track prereleases or draft releases.

You can also run the updater manually from the `Update ShichiZip Cask` workflow in GitHub Actions.
