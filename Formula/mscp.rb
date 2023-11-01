class Mscp < Formula
  desc "Transfer files over multiple ssh (SFTP) connections"
  homepage "https://github.com/upa/mscp"
  url "https://github.com/upa/mscp/releases/download/v0.1.2/mscp-0.1.2.tar.gz"
  sha256 "d80e1e53e1107bd0930baf3bae3b57f91b002df8e49801c4ab63d42129303ccb"
  license "GPL-3.0-only"

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
    system "#{bin}/mscp", "-h"
  end
end
