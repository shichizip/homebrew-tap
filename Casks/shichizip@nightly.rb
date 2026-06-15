cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.5-nightly.20260615.5eeca8e"
  sha256 arm:   "d740e53def430364a2bd07a24e4c3f589d2c8f8a2efb4b55f0a49bc7bfa75bda",
         intel: "fea15c5b7848dda4b4db1b8459c5edd7b6c4ef6c88442b506b9b488ff1087dca"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/27555480880/ShichiZip-5eeca8e-#{arch}.zip"
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
