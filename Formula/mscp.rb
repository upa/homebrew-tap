class Mscp < Formula
  desc "Transfer files over multiple ssh (sftp) sessions."
  homepage "https://github.com/upa/mscp"
  license "GPL-3.0-only"
  head "https://github.com/upa/mscp.git", branch: "main"

  stable do
    url "https://github.com/upa/mscp/archive/refs/tags/v0.0.0.tar.gz"
    sha256 "bf56e457982307b58a2feb086d8acfe66709a2fa51a5b4400c4f0691a68bab1d"
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
