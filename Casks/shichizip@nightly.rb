cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.6-nightly.20260804.8610e33"
  sha256 arm:   "bfb6ca4c7afc00e1878ce7d4cde01d79c8b521ebfac773739decd9cdf07cc11d",
         intel: "223a00fc4fb3610995cacf2313f9793a57fd4b332241331062b9c52bd8f6000e"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/30921955718/ShichiZip-8610e33-#{arch}.zip"
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
