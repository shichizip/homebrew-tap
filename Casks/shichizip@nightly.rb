cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.2-nightly.20260522.8c493d1"
  sha256 arm:   "13960fb8311bc892c58f497bd1a8026f61bf64373c3c1dc10c8125d3afb02193",
         intel: "b542a1399310431a7d747d58767f2224e71eb2717585cf9cdf81c1ba6a86c793"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26284457721/ShichiZip-8c493d1-#{arch}.zip"
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
