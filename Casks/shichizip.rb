cask "shichizip" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.0"
  sha256 arm:   "90df62d9151f98171098df0d35eb4160999941e216f6872be8b90fc7d4e5a416",
         intel: "4541fd2577d38cfbc4d2debba54eb047e5f14087d01a77d64ee16b907c76e7b7"

  url "https://github.com/idawnlight/ShichiZip/releases/download/v#{version}/ShichiZip-v#{version}-#{arch}.zip"
  name "ShichiZip"
  desc "7-Zip derivative GUI"
  homepage "https://github.com/idawnlight/ShichiZip"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "shichizip@nightly"

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
