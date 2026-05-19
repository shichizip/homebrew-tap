cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.1-nightly.20260519.b792f41"
  sha256 arm:   "fbb25e1d6aa98f6b2aeff16255ffb99fa56563466cac2832f4a686e2d868ae04",
         intel: "d1c02a59c83fcdfe395b78f03357b72f0e2945dae5bc6768ea39a81d0daf8d4d"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26111179910/ShichiZip-b792f41-#{arch}.zip"
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
