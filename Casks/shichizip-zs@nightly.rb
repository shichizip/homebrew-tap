cask "shichizip-zs@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.6-nightly.20260804.8610e33"
  sha256 arm:   "863e16b5354192aa3d95d990a211477695fe0ece7ff22146476246221398e555",
         intel: "893052ee2f292a79cd8e0de167031c87af3fc0f70cf726e7fc09343896b0d78e"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/30921955718/ShichiZipZS-8610e33-#{arch}.zip"
  name "ShichiZip ZS"
  desc "7-Zip derivative GUI based on mcmilk/7-Zip-zstd"
  homepage "https://github.com/idawnlight/ShichiZip"

  livecheck do
    skip "Nightly builds track GitHub Actions artifacts"
  end

  conflicts_with cask: "shichizip-zs"

  depends_on macos: :ventura

  app "ShichiZip ZS.app"

  zap trash: [
    "~/Library/Application Scripts/ee.dawn.ShichiZipZS.OpenInShichiZipAction",
    "~/Library/Application Scripts/ee.dawn.ShichiZipZS.RevealInFileManagerAction",
    "~/Library/Application Scripts/ee.dawn.ShichiZipZS.SmartQuickExtractAction",
    "~/Library/Application Scripts/ee.dawn.ShichiZipZS.ArchivePreviewExtension",
    "~/Library/Group Containers/VNM753Y3JX.ShichiZipZS",
    "~/Library/Preferences/ee.dawn.ShichiZipZS.plist",
  ]
end
