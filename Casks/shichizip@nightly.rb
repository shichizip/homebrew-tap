cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.4.0-nightly.20261124.125cbbf"
  sha256 arm:   "a6f02ecf40dd15c78f49a199ed4faad8d7a2a39f7c0082b91cf31067defe1b02",
         intel: "f5d4fdff188cd05a4f5c3f05c740f34416d451b0b325b32ccb27c163c4fe8459"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/45339420161/ShichiZip-125cbbf-#{arch}.zip"
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
