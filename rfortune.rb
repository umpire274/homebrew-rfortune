class Rfortune < Formula
  desc "Rust-based clone of the classic UNIX 'fortune' command"
  homepage "https://github.com/umpire274/rFortune"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/umpire274/rFortune/releases/download/v0.2.2/rfortune-x86_64-apple-darwin.tar.gz"
      version "0.2.2"
      sha256 "319032b6a0e1477a221ffebac7bea8484d158328c94bd84ba22e654044cc8c7a"
    elsif Hardware::CPU.arm?
      url "https://github.com/umpire274/rFortune/releases/download/v0.2.2/rfortune-aarch64-apple-darwin.tar.gz"
      version "0.2.2"
      sha256 "c158679daeb8bce3f5ac5e31635b92e70ef2583e5531b878880444941a8541e6"
    end
  end

  on_linux do
    url "https://github.com/umpire274/rFortune/releases/download/v0.2.2/rfortune-x86_64-unknown-linux-gnu.tar.gz"
    version "0.2.2"
    sha256 "4252913ddf3c46c278aaf28fc6720989a54074136093a0cf71f983c531b1d7e9"
  end

  def install
    bin.install "rfortune"
    pkgshare.install "README.md", "CHANGELOG.md", "LICENSE"
  end

  test do
    assert_match /.+/, shell_output("#{bin}/rfortune")
  end
end

