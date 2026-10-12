cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.2-nightly.20261012.da03799"
  sha256 arm:   "62b75ded1f11bc7f258a73904bb83d7f1e701eb8ed1568c17176fc1d79152479",
         intel: "20e1ee7bc2ab1c966eb9331d31137addf6fb33b3cb92dd7a48373d580591b177"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/38267174583/ShichiZip-da03799-#{arch}.zip"
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
