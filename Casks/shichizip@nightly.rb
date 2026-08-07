cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.0-nightly.20260807.166a7d7"
  sha256 arm:   "770a39cebdf012aeb4b3f5f6b76e647b30f44bf9d20bfac1ec47a87202318591",
         intel: "ca88b760f8f2abe08f3d7ae8ec34b18509cbe8b7e2f04fea257ec0e01597bc64"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/31171844694/ShichiZip-166a7d7-#{arch}.zip"
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
