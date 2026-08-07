cask "shichizip-zs" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.0"
  sha256 arm:   "9821697657ec195827e5dfbce2075b28cc464a83bea9ce1b931a60571612edbb",
         intel: "bbae449b17fc4739faf70df7fdd65bd93bd858e9c2a61617d6040fbcb68323c6"

  url "https://github.com/idawnlight/ShichiZip/releases/download/v#{version}/ShichiZipZS-v#{version}-#{arch}.zip"
  name "ShichiZip ZS"
  desc "7-Zip derivative GUI based on mcmilk/7-Zip-zstd"
  homepage "https://github.com/idawnlight/ShichiZip"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "shichizip-zs@nightly"

  depends_on macos: :ventura

  app "ShichiZip ZS.app"

  zap trash: [
    "~/Library/Application Scripts/ee.dawn.ShichiZipZS.OpenInShichiZipAction",
    "~/Library/Application Scripts/ee.dawn.ShichiZipZS.RevealInFileManagerAction",
    "~/Library/Application Scripts/ee.dawn.ShichiZipZS.SmartQuickExtractAction",
    "~/Library/Application Scripts/ee.dawn.ShichiZipZS.ArchivePreviewExtension",
    "~/Library/Group Containers/VNM753Y3JX.ShichiZipZS",
    "~/Library/Preferences/ee.dawn.ShichiZipZS.plist",
  ]
end
