cask "shichizip-zs@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.4-nightly.20261120.e458dd9"
  sha256 arm:   "a2ed6416fc298090ec7f9e6f2015761b55b2a8b7fb0e1fc2d122fd4d6302f909",
         intel: "0d879f3fdc988b8a39973655ffb5862d574f894e2cb2dc72963ac7809a3361a2"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/44690458837/ShichiZipZS-e458dd9-#{arch}.zip"
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
