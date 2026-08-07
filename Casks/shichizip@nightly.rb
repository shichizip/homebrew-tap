cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.1-nightly.20260807.74986f0"
  sha256 arm:   "0e2622134f24f35f1d557b3041628861c4dd91e043b46779c31eb596de8b67c2",
         intel: "30cb98b2b2d1c0c6af0a8304a05a0248f7c9bc59189f9e49233c56c6dce591e2"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/31176727940/ShichiZip-74986f0-#{arch}.zip"
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
