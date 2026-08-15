cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.2-nightly.20260815.676ff79"
  sha256 arm:   "06e2bdc363c1169cb88f0f1a36a8a0e68adcff40cfbe69945c41b54c33359f11",
         intel: "a8f8f96bdb8e8345df4f4115e1f9774cb89a892e705b252a36b09e0cc7d69c6d"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/31880778152/ShichiZip-676ff79-#{arch}.zip"
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
