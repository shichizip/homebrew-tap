cask "shichizip-zs@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.1-nightly.20260812.d1576f4"
  sha256 arm:   "1fce6a1650ab790eebc8418aa2ebc7941d48b76593979011717e3718c4479f18",
         intel: "e957d39333a91d42db3e424cdc020bdb3631d100640acdd047c787035f78f9c5"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/31573011703/ShichiZipZS-d1576f4-#{arch}.zip"
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
