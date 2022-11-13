class Mscp < Formula
  desc "Transfer files over multiple ssh (sftp) sessions."
  homepage "https://github.com/upa/mscp"
  license "GPL-3.0-only"
  head "https://github.com/upa/mscp.git", branch: "main"

  stable do
    url "https://github.com/upa/mscp/archive/refs/tags/v0.0.1.tar.gz"
    sha256 "93e06a4cb8cc20d0eb49f7613b5a53bc89e883f7ff3425734313aab883f0bf83"
  end

  depends_on "cmake" => :build
  depends_on "libssh" => :build

  def install
    system "cmake", "-S", ".", "-B", "build"
    system "cmake", "--build", "build"
    bin.install "build/mscp"
  end

  test do
    system "#{bin}/mscp -h"
  end
end
