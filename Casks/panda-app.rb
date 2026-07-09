# typed: strict
# frozen_string_literal: true

cask "panda-app" do
  version "0.1.5"
  sha256 "16d743368a531caf3796204779d0dc8a9a3e59c6245a5e1162869ca4e57164e6"

  url "https://github.com/willsantiagomedina/panda/releases/download/v0.1.5/panda-macos-arm64.dmg"
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
