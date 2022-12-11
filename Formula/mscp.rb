class Mscp < Formula
  desc "Transfer files over multiple ssh (SFTP) connections."
  homepage "https://github.com/upa/mscp"
  license "GPL-3.0-only"

  stable do
    url "https://github.com/upa/mscp/releases/download/v0.0.5/mscp-0.0.5.tar.gz"
    sha256 "a266ecde8063e53ff65ff9b7fb56d1af083d0116682ee650b7ad7956e9266198"
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
