cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.2-nightly.20260921.b5f6109"
  sha256 arm:   "099f86dccce87626a3f27c54f23cfbac988aa8e55da8dd7ccf5fc058a6a3d4f7",
         intel: "64247d1d1a051ab26ee9e57297e14439b73c5211602d225ca06044b48745c549"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/35563928412/ShichiZip-b5f6109-#{arch}.zip"
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
