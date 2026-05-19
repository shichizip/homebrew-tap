cask "shichizip-zs@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.1-nightly.20260519.1084427"
  sha256 arm:   "efe63bbde12c196fba9bb98b1cd6bafaf374fdc656de42022f0874021b0dc96a",
         intel: "aeea20871b66f2bd6e7d8bf5067504c76b1c9fb3301425bc0e82379f87a3f55e"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26109397311/ShichiZipZS-1084427-#{arch}.zip"
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
    "~/Library/Group Containers/VNM753Y3JX.ShichiZipZS",
    "~/Library/Preferences/ee.dawn.ShichiZipZS.plist",
  ]
end
