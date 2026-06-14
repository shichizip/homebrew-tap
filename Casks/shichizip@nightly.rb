cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.5-nightly.20260614.6a0b912"
  sha256 arm:   "e1620b19887311d816cac552bae2b74ae0f602abc85f164a9b9a13b575eba31e",
         intel: "78826198221d6a5be21c9b582ed5dd26885a2b83d2eee7a478c5f95e45bb1563"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/27503197861/ShichiZip-6a0b912-#{arch}.zip"
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
