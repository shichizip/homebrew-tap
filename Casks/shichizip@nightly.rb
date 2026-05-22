cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.1-nightly.20260522.4991c74"
  sha256 arm:   "c0f1c2a2c49dbbffeb3d2b934a1c92d6bf2f43a52ab8cc05bce21a8971cf7e31",
         intel: "62b9bb34aa02a0a876f7a357ebff1635cfcd48f216db225cdb2ef2e75deb1ea1"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26272206554/ShichiZip-4991c74-#{arch}.zip"
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
