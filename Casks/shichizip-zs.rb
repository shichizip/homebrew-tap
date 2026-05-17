cask "shichizip-zs" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.1"
  sha256 arm:   "fa81d923d22c6997729342c37b5193e2b3afa9110bf206a46e0d617c30058dd6",
         intel: "f8fc51697b71c5574c29c808a52f32578f5ff9092c391ef6bd80a4aeae65ccc0"

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
    "~/Library/Group Containers/VNM753Y3JX.ShichiZipZS",
    "~/Library/Preferences/ee.dawn.ShichiZipZS.plist",
  ]
end
