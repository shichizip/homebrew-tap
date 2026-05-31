cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.3-nightly.20260531.bb4ca03"
  sha256 arm:   "7acdcaed59374a45af4770131c6091fd510d79852155958a9a8d54a93ec53c73",
         intel: "0085c6a22640d7e3881d76fed6ad02f65a8a301270b9933b6330834e7e998884"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26707651021/ShichiZip-bb4ca03-#{arch}.zip"
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
