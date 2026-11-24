cask "shichizip-zs@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.4.0-nightly.20261124.8c48cfb"
  sha256 arm:   "d15399d243775dd9ca8d782185b514d100a42aa2b4329dcfd08075ea10917c39",
         intel: "4fd0945b3e99a0e802a5f79a0c8d2738f79ec3db36d6c95f2805c269fca24b57"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/45332171915/ShichiZipZS-8c48cfb-#{arch}.zip"
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
