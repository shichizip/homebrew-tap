cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.3-nightly.20261014.16d64d5"
  sha256 arm:   "554456f3d69390238dc15b6c2ed84075a0f08d1a27b52ca6c3f25888c41fbed7",
         intel: "4a002db67f24d8bccc468556b0a0370f1e68c245f2bf3860abf6896984adab67"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/38533158683/ShichiZip-16d64d5-#{arch}.zip"
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
