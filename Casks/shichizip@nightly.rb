cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.1-nightly.20260520.eb715f3"
  sha256 arm:   "3aa78ca75a8bc73cb748d3a659fdc006b5988b547f3c97b05aaf28c9aca44ec7",
         intel: "285d471d9a5cd263b4831451106582954f150f598e938ad7625b204300d402c2"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/26149799361/ShichiZip-eb715f3-#{arch}.zip"
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
