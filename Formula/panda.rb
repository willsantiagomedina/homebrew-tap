# typed: strict
# frozen_string_literal: true

# Panda tiling window manager formula.
class Panda < Formula
  desc "Tiling window manager written in Zig"
  homepage "https://givepanda.tech/"
  url "https://github.com/willsantiagomedina/panda/releases/download/v0.1.2/panda-macos-arm64.tar.gz"
  version "0.1.2"
  sha256 "117268daf5d5d53c89f3f030c7887e3d0d7cd73d06ed99466430b12488cce9cc"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  def install
    bin.install "panda"
  end

  test do
    assert_match "panda commands:", shell_output("#{bin}/panda help")
  end
end
