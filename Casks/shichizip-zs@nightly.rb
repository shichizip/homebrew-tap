cask "shichizip-zs@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.0-nightly.20260517.ded3a3a"
  sha256 arm:   "8ffa37ab4908303e44d9ab415e2a1f9aa19453bac8fdb39de22ff83774b8d76a",
         intel: "f0206ce178ea986321f8d2326f4259a039cb975b43f78e27462be4a392847aa1"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/25989373801/ShichiZipZS-ded3a3a-#{arch}.zip"
  name "ShichiZip ZS"
  desc "7-Zip derivative GUI based on mcmilk/7-Zip-zstd"
  homepage "https://github.com/idawnlight/ShichiZip"

  livecheck do
    skip "Nightly builds track GitHub Actions artifacts"
  end

  conflicts_with cask: "shichizip-zs"

  depends_on macos: :ventura

  app "ShichiZip ZS.app"

  zap trash: [
    "~/Library/Application Scripts/ee.dawn.ShichiZipZS.OpenInShichiZipAction",
    "~/Library/Application Scripts/ee.dawn.ShichiZipZS.RevealInFileManagerAction",
    "~/Library/Application Scripts/ee.dawn.ShichiZipZS.SmartQuickExtractAction",
    "~/Library/Group Containers/VNM753Y3JX.ShichiZipZS",
    "~/Library/Preferences/ee.dawn.ShichiZipZS.plist",
  ]
end
