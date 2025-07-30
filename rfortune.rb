class Rfortune < Formula
  desc "Rust-based clone of the classic UNIX 'fortune' command"
  homepage "https://github.com/umpire274/rFortune"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/umpire274/rFortune/releases/download/v0.3.0/rfortune-0.3.0-x86_64-apple-darwin.tar.gz"
      version "0.3.0"
      sha256 "93ec45477dc75791758d609eb0fa68c76ee74ee6e651c6baa82b92ca7ffb0817"
    elsif Hardware::CPU.arm?
      url "https://github.com/umpire274/rFortune/releases/download/v0.3.0/rfortune-0.3.0-aarch64-apple-darwin.tar.gz"
      version "0.3.0"
      sha256 "2a4e11db7871fdc1602022f8c123ab8e1221099cb663f045aa3db82ebca83063"
    end
  end

  on_linux do
    url "https://github.com/umpire274/rFortune/releases/download/v0.3.0/rfortune-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
    version "0.3.0"
    sha256 "bc64c57fb7b8784eb252f8c18c525e3e7da5ac7a53e5c6542de78ef6dfc3cff7"
  end

  def install
    bin.install "rfortune"
    pkgshare.install "README.md", "CHANGELOG.md", "LICENSE"
  end

  test do
    assert_match /.+/, shell_output("#{bin}/rfortune")
  end
end

