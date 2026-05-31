cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.4-nightly.20260531.2dbf48a"
  sha256 arm:   "0b8c6cceeaabc8880ca2ef4ae02cf7735aaaea65c3aaef2f6c59eda4e51cb47b",
         intel: "c53693550abec3fd9f2fa018d233ee564567d58df94ba73ba32c7c9f00eb8bbb"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26717266503/ShichiZip-2dbf48a-#{arch}.zip"
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
