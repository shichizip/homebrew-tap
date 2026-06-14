cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.5-nightly.20260614.6025f13"
  sha256 arm:   "a807f0deb3258c44dd97d39549898a58f32ff20ffd8237beae268ac530b660b9",
         intel: "080df116c5f09a83da54fd1b8a684b1f33f668be94c4f84f5bf7212d197349e3"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/27501998108/ShichiZip-6025f13-#{arch}.zip"
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
