cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.5-nightly.20260615.9339c41"
  sha256 arm:   "6c046fa7a78b620da6f7fb577d54111abed154d9b93b54374b0379b3a53e48fc",
         intel: "0ef419de3795623d49925e3ee7f85de965e9785296f5e81f229867e870bdb2a9"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/27526635281/ShichiZip-9339c41-#{arch}.zip"
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
