cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.1-nightly.20260519.1084427"
  sha256 arm:   "40f820fea17abf172ca2d208abc074fbf2585fbe8b1ed3da94da244264d747c5",
         intel: "5fc954dfa51b6833b5629d80396235163808843663bfa480e74851ff948a82ec"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26109397311/ShichiZip-1084427-#{arch}.zip"
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
