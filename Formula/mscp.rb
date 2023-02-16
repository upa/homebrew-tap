class Mscp < Formula
  desc "Transfer files over multiple ssh (SFTP) connections."
  homepage "https://github.com/upa/mscp"
  license "GPL-3.0-only"

  stable do
    url "https://github.com/upa/mscp/releases/download/v0.0.6/mscp-0.0.6.tar.gz"
    sha256 "97e44bd6c81a32b896152a9ee9a0ec88ad655edd4f81ef068aacd3bedfc2aa64"
  end

  depends_on "cmake" => :build
  depends_on "openssl@1.1" => :build

  uses_from_macos "zlib"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/mscp"
  end

  test do
    system "#{bin}/mscp -h"
  end
end
