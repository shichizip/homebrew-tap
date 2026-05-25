cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.3-nightly.20260525.26e1917"
  sha256 arm:   "3c4ea9e67ad58861095cd36b97d105bcce7025e485bc4b8bedf253e934d06b56",
         intel: "dd5d8c80edb4e6effe895b8d45a70209c9c43b393e7c98b95bcb6f625a64534f"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26386772115/ShichiZip-26e1917-#{arch}.zip"
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
