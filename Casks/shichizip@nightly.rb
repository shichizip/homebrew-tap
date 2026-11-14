cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.4-nightly.20261114.bf91da5"
  sha256 arm:   "7ca9112f6a1f2d97a2fdd51e28c2cf70131f38889df8b4d95cf0925221b55f08",
         intel: "8a9ae79d39031bb3872314b85f9788e054c02082c1d7cfd6bf9b9b07f733e5ed"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/43613757677/ShichiZip-bf91da5-#{arch}.zip"
  name "ShichiZip"
  desc "7-Zip derivative GUI"
  homepage "https://github.com/idawnlight/ShichiZip"

  livecheck do
    skip "Nightly builds track GitHub Actions artifacts"
  end

  conflicts_with cask: "shichizip"

  depends_on macos: :ventura

  app "ShichiZip.app"

  zap trash: [
    "~/Library/Application Scripts/ee.dawn.ShichiZip.OpenInShichiZipAction",
    "~/Library/Application Scripts/ee.dawn.ShichiZip.RevealInFileManagerAction",
    "~/Library/Application Scripts/ee.dawn.ShichiZip.SmartQuickExtractAction",
    "~/Library/Application Scripts/ee.dawn.ShichiZip.ArchivePreviewExtension",
    "~/Library/Group Containers/VNM753Y3JX.ShichiZip",
    "~/Library/Preferences/ee.dawn.ShichiZip.plist",
  ]
end
