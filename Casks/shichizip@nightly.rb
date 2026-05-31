cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.4-nightly.20260531.1f275f7"
  sha256 arm:   "7e390154209a8999c6160d0af16dc4c37a2c2237733d36555452eca74c9a82b8",
         intel: "adfa7e66e0a10d112cb45f9c38c9b24077e88689d749873ee731e5ea7bb01714"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26716013727/ShichiZip-1f275f7-#{arch}.zip"
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
