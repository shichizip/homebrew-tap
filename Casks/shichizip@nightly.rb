cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.0-nightly.20260517.f0b5788"
  sha256 arm:   "a71f48f817a48491f13f93349fb45d4ee188690f63b9beff244bd5b88df223f1",
         intel: "02b8e7388b25616a02b579522d4d1286364c2496c94f46d1455c78ca2b645f88"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/25988680202/ShichiZip-f0b5788-#{arch}.zip"
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
