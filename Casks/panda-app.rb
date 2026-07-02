# typed: strict
# frozen_string_literal: true

cask "panda-app" do
  version "0.1.3"
  sha256 "06061b9fd036829ab360d6b2bed76bd6dfe7249624ddf87504994f6fa2c4a6ee"

  url "https://github.com/willsantiagomedina/panda/releases/download/v0.1.3/panda-macos-arm64.dmg"
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
