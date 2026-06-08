cask "shichizip@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.4-nightly.20260608.327196a"
  sha256 arm:   "cdd79dfbd7d3261a079bbc9684ba44b7dcd98a24d4d927fc8225718585260a48",
         intel: "fa69ebd714216667b0c5759d05c386c3fca8abf12089975416ef2052dad5ab8b"

  url "https://nightly.link/idawnlight/ShichiZip/actions/runs/27117900096/ShichiZip-327196a-#{arch}.zip"
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
