cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.1-nightly.20260814.131b6c8"
  sha256 arm:   "0fcdb33430f1b1ba7915903805d5fc309772db9daa61c6ac36d926f5ced92efa",
         intel: "9746b0680dcd1ad2aa7b3958a507583b2d7314fd52df1a7ba2607057da5d4794"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/31803616654/ShichiZip-131b6c8-#{arch}.zip"
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
