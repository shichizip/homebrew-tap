cask "shichizip-zs@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.4.0-nightly.20261124.125cbbf"
  sha256 arm:   "2abbc5af5c4802cf3dc344926c6d41561f6febe511eb3f2ef90efa6310a911f6",
         intel: "534ba1acb9755dfd773e6e0a8a9a5f31767eab76cab89bc6302fbdf8e379bc97"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/45339420161/ShichiZipZS-125cbbf-#{arch}.zip"
  name "ShichiZip ZS"
  desc "7-Zip derivative GUI based on mcmilk/7-Zip-zstd"
  homepage "https://github.com/idawnlight/ShichiZip"

  livecheck do
    skip "Nightly builds track GitHub Actions artifacts"
  end

  conflicts_with cask: "shichizip-zs"

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
