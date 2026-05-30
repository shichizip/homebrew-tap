cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.3-nightly.20260530.37d868d"
  sha256 arm:   "f09e63c3854257e3261482c6c88ddc7a3f2a1edc4cba53085202ddeaea428fb3",
         intel: "db17182dc617e0358ea5c6a0248d6088a5bc4301456bf66fd1b115c49d6322b1"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26688674260/ShichiZip-37d868d-#{arch}.zip"
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
