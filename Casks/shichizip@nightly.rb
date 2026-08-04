cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.6-nightly.20260804.ca610c8"
  sha256 arm:   "3487ad9bcefaac9f9fc9923ff9d977cf558ff184e61285f83ec270c5a8ec1f5b",
         intel: "455d9455130b2b83d131f84724a4caafd1a7681bc5668b5c303a8d28104deb71"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/30921524235/ShichiZip-ca610c8-#{arch}.zip"
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
