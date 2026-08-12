cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.1-nightly.20260812.d1576f4"
  sha256 arm:   "7f5bb65e0a0899fe22b3812ed4f9254973410cf99f7dc9f36309df40c6daf3e1",
         intel: "96e00adf5e3acfee8e6c5e04890405fb858a85b72ace1290d39579c2b5a45640"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/31573011703/ShichiZip-d1576f4-#{arch}.zip"
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
