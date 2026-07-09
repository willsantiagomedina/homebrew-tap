# typed: strict
# frozen_string_literal: true

# Panda tiling window manager formula.
class Panda < Formula
  desc "Tiling window manager written in Zig"
  homepage "https://givepanda.tech/"
  url "https://github.com/willsantiagomedina/panda/releases/download/v0.1.4/panda-macos-arm64.tar.gz"
  version "0.1.4"
  sha256 "0ce28d5eac379fcdb9d8ae3349c40d699500efa7c8e11d7e8c29ecaaac7641e7"

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    bin.install "panda"
  end

  test do
    assert_match "panda commands:", shell_output("#{bin}/panda help")
  end
end
