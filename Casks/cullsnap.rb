cask "cullsnap" do
  version "2.16.2"
  sha256 "a1973883ac1f45ca97b22672f11ee22fa065107c0249b395445d321fedb6c4f7"

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
