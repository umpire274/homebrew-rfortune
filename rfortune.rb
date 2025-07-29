class Rfortune < Formula
  desc "Rust-based clone of the classic UNIX 'fortune' command"
  homepage "https://github.com/umpire274/rFortune"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/umpire274/rFortune/releases/download/v0.2.2/rfortune-x86_64-apple-darwin.tar.gz"
      sha256 "eda8c76ea8a6f9883a523ac2730ba4e0ce12f009ba2cd0489aa3f46b8089a77e"
    elsif Hardware::CPU.arm?
      url "https://github.com/umpire274/rFortune/releases/download/v0.2.2/rfortune-aarch64-apple-darwin.tar.gz"
      sha256 "eac3e22619ffa3a98045cba88f34aa163a1548c8f0bc5b3dfaea83180f243df8"
    end
  end

  on_linux do
    url "https://github.com/umpire274/rFortune/releases/download/v0.2.2/rfortune-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b16ca2b5dcc163bc84e5eebdb360fe13663948f17427a9777dde95977822fd41"
  end

  def install
    bin.install "rfortune"
    pkgshare.install "README.md", "CHANGELOG.md"
  end

  test do
    assert_match /.+/, shell_output("#{bin}/rfortune")
  end
end

