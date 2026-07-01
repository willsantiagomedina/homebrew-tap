# typed: strict
# frozen_string_literal: true

# Panda tiling window manager formula.
class Panda < Formula
  desc "Tiling window manager written in Zig"
  homepage "https://givepanda.tech/"
  url "https://github.com/willsantiagomedina/panda/releases/download/v0.1.0/panda-macos-arm64.tar.gz"
  version "0.1.0"
  sha256 "f27d21069206d005df9b3cd22a3e44dc4a0016bd077ad6968b231aee9cfa1245"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  def install
    bin.install "panda"
  end

  test do
    assert_match "panda commands:", shell_output("#{bin}/panda help")
  end
end
