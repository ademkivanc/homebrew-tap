cask "easyclipboard" do
  version "2.0.5"
  sha256 "84d83341f4bbb93978c897ef8981550b55382ff6b62fb60fc0dd23bd8f31d659"

  url "https://easyclipboard.app/download/EasyClipboard.dmg"
  name "EasyClipboard"
  desc "Visual clipboard manager for macOS"
  homepage "https://easyclipboard.app"

  depends_on macos: ">= :ventura"

  app "EasyClipboard.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/EasyClipboard.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/EasyClipboard",
    "~/Library/Preferences/com.easyclipboard.app.plist",
  ]
end
