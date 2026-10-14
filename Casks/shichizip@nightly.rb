cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.3-nightly.20261014.a90fc8a"
  sha256 arm:   "cc0b6bd3a811c87f846472953360406bb952d3194bdfabcd86ab4f695c76a1b3",
         intel: "377ea1c10f4a07d9d4fa3baeb346297afffa1d1b4a8445f394dd851a7e1c5c49"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/38592053775/ShichiZip-a90fc8a-#{arch}.zip"
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
