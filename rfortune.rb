class Rfortune < Formula
  desc "Rust-based clone of the classic UNIX 'fortune' command"
  homepage "https://github.com/umpire274/rFortune"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/umpire274/rFortune/releases/download/v0.3.0/rfortune-x86_64-apple-darwin.tar.gz"
      version "0.3.0"
      sha256 "7e7fcbc3b70b5a45fee6df01308873e9df057cf3a786b55f8eaf7076f89677a3"
    elsif Hardware::CPU.arm?
      url "https://github.com/umpire274/rFortune/releases/download/v0.3.0/rfortune-aarch64-apple-darwin.tar.gz"
      version "0.3.0"
      sha256 "501d5260eb60fdda2d21af0e523327edc3db02e15c7db43585c08de1b77dadf7"
    end
  end

  on_linux do
    url "https://github.com/umpire274/rFortune/releases/download/v0.3.0/rfortune-x86_64-unknown-linux-gnu.tar.gz"
    version "0.3.0"
    sha256 "011596e9fe1fd04cb21c89d0597b4ede3df4c1869c1dc8728f90dec1c456f2e0"
  end

  def install
    bin.install "rfortune"
    pkgshare.install "README.md", "CHANGELOG.md", "LICENSE"
  end

  test do
    assert_match /.+/, shell_output("#{bin}/rfortune")
  end
end

