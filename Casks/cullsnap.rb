cask "cullsnap" do
  version "2.12.0"
  sha256 "53c424ddae8c7a6b87c8a0fac73bcaaeb683987fb85319b0a8e6c4da962921ba"

  url "https://github.com/Abhishekmitra-slg/CullSnap/releases/download/v#{version}/CullSnap-macos-universal.zip"
  name "CullSnap"
  desc "High-performance photo & video culling tool for photographers"
  homepage "https://github.com/Abhishekmitra-slg/CullSnap"

  depends_on macos: ">= :monterey"

  app "CullSnap.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/CullSnap.app"],
                   sudo: false
  end

  zap trash: [
    "~/.cullsnap",
    "~/Library/Application Support/CullSnap",
    "~/Library/Caches/CullSnap",
    "~/Library/Preferences/com.abhishekmitra.cullsnap.plist",
  ]
end
