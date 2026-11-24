cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.4.0-nightly.20261124.8c48cfb"
  sha256 arm:   "ebb80896508d7f17ad3716194b9a4b683c9f0e678d90348e024d4c6aeb7fbd21",
         intel: "59f109299201f854442e23adf78db611168f318910e1582e0f6804902bbcbb84"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/45332171915/ShichiZip-8c48cfb-#{arch}.zip"
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
