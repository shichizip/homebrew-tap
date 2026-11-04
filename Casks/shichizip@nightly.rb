cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.4-nightly.20261104.41d851a"
  sha256 arm:   "d8865d37d35d38116cdcd22f0b851eb6a14475038c0149dd3e04f97bf53df9e5",
         intel: "cac7ccaaad2a66ae52c7bc07df52f625fe8051ad61cb06c33dfb5fa23e481e9e"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/41848150023/ShichiZip-41d851a-#{arch}.zip"
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
