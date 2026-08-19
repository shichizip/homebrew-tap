cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.2-nightly.20260819.b60c261"
  sha256 arm:   "156896e1f664fff43942e424ca284dcffb67816bef8545c40c01780f7735fdb1",
         intel: "d050ce4b49116fd32671ca5f0fe07ca51a647bc5cb0361f10468aaf247db746f"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/32233140103/ShichiZip-b60c261-#{arch}.zip"
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
