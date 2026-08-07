cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.1-nightly.20260807.b1fa4b7"
  sha256 arm:   "8c47af1604f5ca8b2155cbf592cf68ba8a60c02fcb16fa16e7ed4669baaefefc",
         intel: "adaa358d4de5b5cc21aea7ea0fe05d59aa75caa9a2dbfd2059878f26086ad118"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/31175963799/ShichiZip-b1fa4b7-#{arch}.zip"
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
