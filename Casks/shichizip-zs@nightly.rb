cask "shichizip-zs@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.5-nightly.20260615.5eeca8e"
  sha256 arm:   "57e270ff999c76fdc7c33a3c106418b69e18ebca49d0981e53b1a5edd9d3e8dc",
         intel: "d8d7771a31f2a435e148e001edcd687410984e20826380caeea75a50446d0347"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/27555480880/ShichiZipZS-5eeca8e-#{arch}.zip"
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
