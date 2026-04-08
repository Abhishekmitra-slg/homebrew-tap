cask "cullsnap" do
  version "2.16.3"
  sha256 "65eaf0a84369e0eb165600fea8bc566ea1be2c01458ab73fc5f220d651eb0f57"

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
