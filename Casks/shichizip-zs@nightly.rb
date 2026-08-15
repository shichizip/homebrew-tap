cask "shichizip-zs@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.2-nightly.20260815.676ff79"
  sha256 arm:   "cc2e835ea61265c96590fb7ebe784e2abc51d89553c9a4cd25369f93f5b7613b",
         intel: "b9db382c0fc05127ca26803412b7ab9db16a273fe977587e3356e258fa1fa4a5"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/31880778152/ShichiZipZS-676ff79-#{arch}.zip"
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
