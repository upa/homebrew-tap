class Mscp < Formula
  desc "Transfer files over multiple SSH (SFTP) connections"
  homepage "https://github.com/upa/mscp"
  url "https://github.com/upa/mscp/releases/download/v0.2.2/mscp-0.2.2.tar.gz"
  sha256 "ea94bd9097f80ff04fc45f597bc9f69d2f8d4de5f1542823aa9ee8cfc1a8df4a"
  license "GPL-3.0-only"

  depends_on "cmake" => :build
  depends_on "openssl@3" => :build

  uses_from_macos "zlib"

  def install
    system "cmake", "-S", ".", "-B", "build",
           "-DOPENSSL_ROOT_DIR=#{HOMEBREW_PREFIX}/opt/openssl@3", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/mscp"
    man1.install "build/mscp.1"
  end

  test do
    system "#{bin}/mscp", "-h"
  end
end
