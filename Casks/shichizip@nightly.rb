cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.3-nightly.20260530.b78fda8"
  sha256 arm:   "5c1d909313986e6e5f2b111d8a2cb19e1fdf0ca1ca7771f4cb0ebc39e40b92b9",
         intel: "29ac5d2f2dd980cafb6f744ee8777d2a10305afd82b8cdc6a4e21e31c4cb4347"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26689053300/ShichiZip-b78fda8-#{arch}.zip"
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
