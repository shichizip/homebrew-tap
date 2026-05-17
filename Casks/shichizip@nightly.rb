cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.0-nightly.20260517.ded3a3a"
  sha256 arm:   "0a24292b71fea32cdd0298c27dd7383be8fdd107eee1e801ffa9f0eadc82ce34",
         intel: "1eb139aad33579589bc9f5b4147f2cc9f0cf935f6a98ee6d8da599f8ccc63d70"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/25989373801/ShichiZip-ded3a3a-#{arch}.zip"
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
