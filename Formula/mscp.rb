class Mscp < Formula
  desc "Transfer files over multiple SSH (SFTP) connections"
  homepage "https://github.com/upa/mscp"
  url "https://github.com/upa/mscp/releases/download/v0.1.4/mscp-0.1.4.tar.gz"
  sha256 "adb69493bcdff9582e4652092e4dd4c93e62ccae9d469dcdcb79df112fd5a1b8"
  license "GPL-3.0-only"

  depends_on "cmake" => :build
  depends_on "openssl@1.1" => :build

  uses_from_macos "zlib"

  def install
    system "cmake", "-S", ".", "-B", "build",
           "-DOPENSSL_ROOT_DIR=#{HOMEBREW_PREFIX}/opt/openssl@1.1", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/mscp"
    man1.install "build/mscp.1"
  end

  test do
    system "#{bin}/mscp", "-h"
  end
end
