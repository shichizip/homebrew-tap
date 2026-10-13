cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.3-nightly.20261013.ead6f00"
  sha256 arm:   "6a61cd7a74c6f1b6e1c2009e82ecd0e4b7505249f077a7d73f863b4d340de1b6",
         intel: "7860d52fa557100cc4029c7107ed3302974e8193f5d141c5a41308b9a1bc72d7"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/38431151422/ShichiZip-ead6f00-#{arch}.zip"
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
