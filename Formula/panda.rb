# typed: strict
# frozen_string_literal: true

# Panda tiling window manager formula.
class Panda < Formula
  desc "Tiling window manager written in Zig"
  homepage "https://givepanda.tech/"
  url "https://github.com/willsantiagomedina/panda/releases/download/v0.1.3/panda-macos-arm64.tar.gz"
  version "0.1.3"
  sha256 "38c239f450ad87bcf3755374c063f710fa0d0d98bd6402cb584dfa770e5a7faf"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  def install
    bin.install "panda"
  end

  test do
    assert_match "panda commands:", shell_output("#{bin}/panda help")
  end
end
