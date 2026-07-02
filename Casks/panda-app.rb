# typed: strict
# frozen_string_literal: true

cask "panda-app" do
  version "0.1.1"
  sha256 "f423f66cc5d2b62ceac87bf086c15430441332b51e444eb54b59963b65d55e75"

  url "https://github.com/willsantiagomedina/panda/releases/download/v0.1.1/panda-macos-arm64.dmg"
  name "Panda"
  desc "Tiling window manager written in Zig"
  homepage "https://givepanda.tech/"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "Panda.app"

  postflight do
    system "xattr", "-dr", "com.apple.quarantine", "#{appdir}/Panda.app"
  end

  uninstall quit:   "dev.givepanda.app",
            delete: [
              "/tmp/panda-#{`id -u`.strip}.sock",
              "~/Library/LaunchAgents/dev.givepanda.panda.plist",
            ]
end
