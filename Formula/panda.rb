# typed: strict
# frozen_string_literal: true

# Panda tiling window manager formula.
class Panda < Formula
  desc "Tiling window manager written in Zig"
  homepage "https://givepanda.tech/"
  url "https://github.com/willsantiagomedina/panda/releases/download/v0.1.1/panda-macos-arm64.tar.gz"
  version "0.1.1"
  sha256 "445e02fa02816e79fdfc1296e5f22d4e03d77780cd53cefbe9af6d30bb6a999f"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  def install
    bin.install "panda"
  end

  test do
    assert_match "panda commands:", shell_output("#{bin}/panda help")
  end
end
