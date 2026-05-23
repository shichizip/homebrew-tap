cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.2-nightly.20260523.a475ba1"
  sha256 arm:   "d9ce8af93154b439b09e4483b6aa1f4aed997100c6e2bdd269dd1c9c66c4e88f",
         intel: "469ad93453f514c5cccd84296d0019ddafd9bfad7e0c76378479f4b5e40479c3"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26336073307/ShichiZip-a475ba1-#{arch}.zip"
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
    "~/Library/Group Containers/VNM753Y3JX.ShichiZip",
    "~/Library/Preferences/ee.dawn.ShichiZip.plist",
  ]
end
