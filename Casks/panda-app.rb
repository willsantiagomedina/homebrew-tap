# typed: strict
# frozen_string_literal: true

cask "panda-app" do
  version "0.1.4"
  sha256 "45b1bc698c9ed6273ff68806269cd9d39e65b5318885854819755ebf59753d86"

  url "https://github.com/willsantiagomedina/panda/releases/download/v0.1.4/panda-macos-arm64.dmg"
  name "Panda"
  desc "Tiling window manager written in Zig"
  homepage "https://givepanda.tech/"

  depends_on macos: :ventura
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
