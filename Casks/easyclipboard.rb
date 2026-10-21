cask "easyclipboard" do
  version "2.0.3"
  sha256 "c95f6eefc33ed1998e71c7d49a0e4b99034be7fbd1a22f9d33efd932dee47327"

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
