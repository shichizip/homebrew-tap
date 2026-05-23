cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.2-nightly.20260523.3299d75"
  sha256 arm:   "e98e3503d6305e2c536fae8470facd9da6dbbbbe2ca8eb872fdfd791b99b7e11",
         intel: "7e069a55ec4c38a518fd38e6691bd5ad158885899a43c7fcef906c263e6b022d"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26328380867/ShichiZip-3299d75-#{arch}.zip"
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
    "~/Library/Group Containers/VNM753Y3JX.ShichiZip",
    "~/Library/Preferences/ee.dawn.ShichiZip.plist",
  ]
end
