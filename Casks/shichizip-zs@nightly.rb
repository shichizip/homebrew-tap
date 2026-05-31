cask "shichizip-zs@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.3-nightly.20260531.d585c3b"
  sha256 arm:   "39a9819afbb445e0ce06de5b172735a0623f4ca6690df859562818e9e678c491",
         intel: "af081f833c2fb325d3de6964fd5340dd17c3e8d0b1c545f837b89ee0d15d45ac"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26710433685/ShichiZipZS-d585c3b-#{arch}.zip"
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
