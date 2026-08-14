cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.1-nightly.20260814.cba2fe6"
  sha256 arm:   "8665369d95c8bbfdb16ac027bdeec3e267dd4ee5c7967e39d0087e75c5f949d8",
         intel: "ea846c6a7fecbf7664b724b51ccf5c956353a8e624f317f1e0c65d8a13056909"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/31801877382/ShichiZip-cba2fe6-#{arch}.zip"
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
