cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.6-nightly.20260805.6fbd4fa"
  sha256 arm:   "e1648e8d57bff502fa94a8bccbcf50926ebbe3f96c92ebc74a3078b1b81cca66",
         intel: "972a76917b79a89459de0abbf091d74c20830213c4093571bcabb7a25f3849d7"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/30999746401/ShichiZip-6fbd4fa-#{arch}.zip"
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
