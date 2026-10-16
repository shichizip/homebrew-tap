cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.3-nightly.20261016.ae10554"
  sha256 arm:   "27512eeb3ad01608971db30ab94eb2bd31e7cfa35fb7e1349d8dd9e4f1181e4e",
         intel: "e3d4e7111c9c4052606fe1d9352f9031028695c618edb6e4134b671367239ab8"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/38877001073/ShichiZip-ae10554-#{arch}.zip"
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
