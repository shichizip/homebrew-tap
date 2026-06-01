cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.4-nightly.20260601.3e869dc"
  sha256 arm:   "3ab763f9f7f8d85280963c32d40b28b8b9069e53427c9b98c1dbbc68ad7abc3b",
         intel: "7512563c9557df28fe95f5bcaa8866827a91fee0d6612a06fa34f3a05a5d957a"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26753562806/ShichiZip-3e869dc-#{arch}.zip"
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
