cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.3-nightly.20260531.d585c3b"
  sha256 arm:   "2a4a8d923f1101f327e1173fc9f8c57366a86d363099989d01ffec763e549ba1",
         intel: "dfea47f601af7b838ac021deb0216dec61fe7eea375fa88e0e10105b4ef3597c"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26710433685/ShichiZip-d585c3b-#{arch}.zip"
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
