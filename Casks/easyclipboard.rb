cask "easyclipboard" do
  version "2.0.3"
  sha256 "407d8ad738ddef7ec8f178fbf95167f61db9e615e6a4a10a5ae989b521674634"

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
