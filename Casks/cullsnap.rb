cask "cullsnap" do
  version "2.15.0"
  sha256 "5f82a0272e2f3745a314b6170a524417738941a785f945d2eb877ae1e9833a68"

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
