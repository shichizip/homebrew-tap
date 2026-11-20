cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.4-nightly.20261120.e458dd9"
  sha256 arm:   "9aad575a6619d917c185a61b52b8b3f136d247ee40f7b6afd76d96528bccdd1c",
         intel: "6541f38d828e8f5c9ad495cb3d15d26b0a9fc380fe5137b0aeb63e14544946b2"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/44690458837/ShichiZip-e458dd9-#{arch}.zip"
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
