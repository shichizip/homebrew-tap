cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.4-nightly.20261102.25ebc8b"
  sha256 arm:   "ca4dcb89664c0c78a8d4c5d5c7bf1dc996dc54fedaac1298fd7a6364cdefb27b",
         intel: "f1a61394a44fc800e31fa0465578284e4678df75cedb1abd4bc3b0bdfd96cf8b"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/41477403182/ShichiZip-25ebc8b-#{arch}.zip"
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
