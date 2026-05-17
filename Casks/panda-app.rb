cask "panda-app" do
  version "latest"
  sha256 "f8962ae59dbfbdb2eb1f851be65c22598591d213f6e5722b0d405696bdfe6734"

  url "https://givepanda.tech/releases/latest/panda-macos-universal.dmg"
  name "Panda"
  desc "macOS tiling window manager"
  homepage "https://givepanda.tech"

  depends_on macos: ">= :ventura"

  postflight do
    system "xattr", "-dr", "com.apple.quarantine", "#{appdir}/Panda.app"
  end

  app "Panda.app"

  uninstall quit: "dev.givepanda.app",
            delete: [
              "~/Library/LaunchAgents/dev.givepanda.panda.plist",
              "/tmp/panda-#{`id -u`.strip}.sock",
            ]
end
