cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.6-nightly.20260702.68eca19"
  sha256 arm:   "85c6d6028cac5b305d1c389545b1b0b5810a9d62c2091c99cd3c9364cb4a42e4",
         intel: "ab1e470b304ab61d722630ca387feb9dacaba7684b6038db1ddc935028a2bf59"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/28571039873/ShichiZip-68eca19-#{arch}.zip"
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
