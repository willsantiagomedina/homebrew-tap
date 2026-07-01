# typed: strict
# frozen_string_literal: true

cask "panda-app" do
  version "0.1.0"
  sha256 "1d88607ce8cd2503e9dd7116f6b90a02425c58d2a48457114361dc96e655f28d"

  url "https://github.com/willsantiagomedina/panda/releases/download/v0.1.0/panda-macos-arm64.dmg"
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
