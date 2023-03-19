class Mscp < Formula
  desc "Transfer files over multiple ssh (SFTP) connections."
  homepage "https://github.com/upa/mscp"
  license "GPL-3.0-only"

  stable do
    url "https://github.com/upa/mscp/releases/download/v0.0.8/mscp-0.0.8.tar.gz"
    sha256 "b4df418c780d3e7614a0b9c796b88f643fa2ca9bb4ffea6192fddefc650dea24"
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
