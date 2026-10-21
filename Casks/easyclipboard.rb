cask "easyclipboard" do
  version "2.0.4"
  sha256 "aea83b319ad7c7a160745df3c1764931901cec5bc74291fd4290296d9e6f668b"

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
