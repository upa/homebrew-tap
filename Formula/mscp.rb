class Mscp < Formula
  desc "Transfer files over multiple SSH (SFTP) connections"
  homepage "https://github.com/upa/mscp"
  url "https://github.com/upa/mscp/releases/download/v0.2.0/mscp-0.2.0.tar.gz"
  sha256 "c11a63655f0a2b0b9ac5cd3d7f46f228d33accb4e1a7c0fd1d2ddb5912065c52"
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
