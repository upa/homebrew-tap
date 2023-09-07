class Mscp < Formula
  desc "Transfer files over multiple ssh (SFTP) connections."
  homepage "https://github.com/upa/mscp"
  license "GPL-3.0-only"

  stable do
    url "https://github.com/upa/mscp/releases/download/v0.1.0/mscp-0.1.0.tar.gz"
    sha256 "bed8f34e79e77238481a697e0ba940ed732d27b057f0a14e7a0cfe84bbd76733"
  end

  depends_on "cmake" => :build
  depends_on "openssl@1.1" => :build

  uses_from_macos "zlib"

  def install
    system "cmake", "-S", ".", "-B", "build",
           "-DOPENSSL_ROOT_DIR=#{HOMEBREW_PREFIX}/opt/openssl@1.1", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/mscp"
  end

  test do
    system "#{bin}/mscp -h"
  end
end
