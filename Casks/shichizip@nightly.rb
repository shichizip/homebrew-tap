cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.6-nightly.20260717.7b6d789"
  sha256 arm:   "e69c70b9709ab7a96123cdace971cb96bbb057675c89af83cefa56b852c6b7da",
         intel: "d29c5d4d1ca9d4f5d11767274011c75d835cdb050cd531cfc4c4739daa130a02"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/29604844868/ShichiZip-7b6d789-#{arch}.zip"
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
