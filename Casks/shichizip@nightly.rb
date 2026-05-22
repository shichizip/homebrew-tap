cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.2-nightly.20260522.afa5079"
  sha256 arm:   "d089eb038f517ff83a41afda4ed0adabdef9cd68926fccbfff7be8991a39e739",
         intel: "0ee3c6e9b8c15ed80fe0663808a9715669da9126164975d927a4d3cddaf1f9bf"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26273761567/ShichiZip-afa5079-#{arch}.zip"
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
    "~/Library/Group Containers/VNM753Y3JX.ShichiZip",
    "~/Library/Preferences/ee.dawn.ShichiZip.plist",
  ]
end
