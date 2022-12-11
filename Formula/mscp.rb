class Mscp < Formula
  desc "Transfer files over multiple ssh (SFTP) connections."
  homepage "https://github.com/upa/mscp"
  license "GPL-3.0-only"

  stable do
    url "https://github.com/upa/mscp/releases/download/v0.0.5/mscp-0.0.5.tar.gz"
    sha256 "7ba64d117dcd42e4097cbdd920a120af5834788bbdaaf04a38f50d79867c368f"
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
