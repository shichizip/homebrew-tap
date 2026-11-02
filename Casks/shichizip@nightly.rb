cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.4-nightly.20261102.7bfc0a3"
  sha256 arm:   "5a84be6443cb5415db8a9518e2cbd08a2c99fc8525aba81e8bd92d898a60a226",
         intel: "83daafbfcdfc06268bc8bc3acf405f45dc7aea9527fb1d41929ad377d2e0fd97"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/41468603291/ShichiZip-7bfc0a3-#{arch}.zip"
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
