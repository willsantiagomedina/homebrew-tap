# typed: strict
# frozen_string_literal: true

# Panda tiling window manager formula.
class Panda < Formula
  desc "Tiling window manager written in Zig"
  homepage "https://givepanda.tech/"
  url "https://github.com/willsantiagomedina/panda/releases/download/v0.1.5/panda-macos-arm64.tar.gz"
  version "0.1.5"
  sha256 "f86aa6bb8c192d7be52ac0182a5dcebaf17581c4743b4d0e7f66091b602fd177"

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    bin.install "panda"
  end

  test do
    assert_match "panda commands:", shell_output("#{bin}/panda help")
  end
end
