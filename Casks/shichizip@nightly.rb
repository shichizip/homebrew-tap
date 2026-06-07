cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.4-nightly.20260607.6c18f9c"
  sha256 arm:   "8595f1299651058e6bc4f9bc168f912f685f1d6badca37786af4ced486a9941a",
         intel: "5e882acafb20ca5567f5a5390b73a906c6ff21bda57caa5b680fe0e227d07250"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/27094345895/ShichiZip-6c18f9c-#{arch}.zip"
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
