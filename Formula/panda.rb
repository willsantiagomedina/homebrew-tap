class Panda < Formula
  desc "macOS tiling window manager written in Zig"
  homepage "https://givepanda.tech"
  url "https://givepanda.tech/releases/latest/panda-macos-universal.tar.gz"
  sha256 "543e8cfb83ba06f047a7df6aaff8c494bdd111785dfcdfbe03b0238cf3f9b404"
  version "latest"

  def install
    bin.install "panda"
  end

  test do
    assert_match "panda commands:", shell_output("#{bin}/panda help")
  end
end
