cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.5-nightly.20260613.e5d88d7"
  sha256 arm:   "fdfba25a6d5f58140497aed853e92eb5d4269bc9012667cbdc11868567ffb9fb",
         intel: "adc98e8364a29a29edc5470b0f5ddb85d17819ae4771b272998da0cca65911a3"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/27468775932/ShichiZip-e5d88d7-#{arch}.zip"
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
