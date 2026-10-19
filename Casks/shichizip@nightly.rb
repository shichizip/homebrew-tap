cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.3-nightly.20261019.dcc87d4"
  sha256 arm:   "dfe6dacf7fb92f92be3171e1f8b7707b4788c38806e6d79fb6b342a7f8f0d74c",
         intel: "4b001c4d2dd994d2ceab0d9173c14155cadefd405b14bacf9ea8a245e3e14222"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/39256440327/ShichiZip-dcc87d4-#{arch}.zip"
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
