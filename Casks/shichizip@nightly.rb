cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.0-nightly.20260514.8d76dfb"
  sha256 arm:   "8daf652d06ed8ccc708ad7cec73772e77a60b4c787614620188a67afc1293c2e",
         intel: "f4d1326a02ea7b954c9985c7b73f0d63980fc9bf79a5865201c43055035df8a1"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/25864587870/ShichiZip-8d76dfb-#{arch}.zip"
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
