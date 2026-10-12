cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.2-nightly.20261012.e772073"
  sha256 arm:   "e0e599ef98933e6895d07f9aff2c2b8053bf83624b16273e46f9af4882ed3f94",
         intel: "7f182653922cffe1d6a5091c06ea678cea0092803aa9814efce2f26f1333c507"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/38284858620/ShichiZip-e772073-#{arch}.zip"
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
