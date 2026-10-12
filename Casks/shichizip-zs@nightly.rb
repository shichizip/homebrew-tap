cask "shichizip-zs@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.2-nightly.20261012.e772073"
  sha256 arm:   "8735ea080357bbe1540f9d88e38ab5a9dea93f24f68e6df6fea43b3a87f850fa",
         intel: "9e822a0083b70ae56150383517e574609d502469626b945560b340e97b2247e7"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/38284858620/ShichiZipZS-e772073-#{arch}.zip"
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
