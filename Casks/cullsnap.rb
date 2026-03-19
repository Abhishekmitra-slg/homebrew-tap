cask "cullsnap" do
  version "2.0.3"
  sha256 "b3f42889c0869c92a35018f8361b8d6636e8927b613b0eab0bf341c42f685b6f"

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
