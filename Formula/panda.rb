# typed: strict
# frozen_string_literal: true

# Panda tiling window manager formula.
class Panda < Formula
  desc "Tiling window manager written in Zig"
  homepage "https://givepanda.tech/"
  url "https://github.com/willsantiagomedina/panda/releases/download/v0.1.3/panda-macos-arm64.tar.gz"
  version "0.1.3"
  sha256 "0c880913123691f0120a896f29c8278f4870c08cf91a1f615cea2b612229d43c"

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    bin.install "panda"
  end

  test do
    assert_match "panda commands:", shell_output("#{bin}/panda help")
  end
end
