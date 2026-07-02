# typed: strict
# frozen_string_literal: true

cask "panda-app" do
  version "0.1.2"
  sha256 "c2eba9585b925a140b1d9f739a64ebfef9862f4b8566fcddd480a8af84abbcb9"

  url "https://github.com/willsantiagomedina/panda/releases/download/v0.1.2/panda-macos-arm64.dmg"
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
