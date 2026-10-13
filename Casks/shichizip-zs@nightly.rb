cask "shichizip-zs@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.3-nightly.20261013.ead6f00"
  sha256 arm:   "4629d96ac64d05551153480333cd895a533fa6cc6d54dc5e5044d5477f695cd6",
         intel: "52f2e1e112ee43cb37d7b9a8d32f829f9eb87b8fd1bfbe561a53bf2da78b95fa"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/38431151422/ShichiZipZS-ead6f00-#{arch}.zip"
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
