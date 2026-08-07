cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.0-nightly.20260807.88149b6"
  sha256 arm:   "1c835ac6d8c47b891e549853b730a8a0e6715ee806f7c44be9ecf5bb2f74ba1a",
         intel: "e34fc97ca593c2e5676356808031271749c497c371014c0e1bd7e50bff90a424"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/31165262827/ShichiZip-88149b6-#{arch}.zip"
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
