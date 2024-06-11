class Ovc < Formula
  desc "CLI to install the virtual-cluster-operator Helm chart"
  homepage "https://github.com/OpenVirtualCluster/cli"
  version "0.0.2"

  if OS.mac?
    url "https://github.com/OpenVirtualCluster/cli/releases/download/v0.0.2/ovc-darwin"
    sha256 "b37fb0e4bd6be2ed0205424fbe2774cb480a2ad64d00a0a9a42af554c7ef68e0"
  elsif OS.linux?
    url "https://github.com/OpenVirtualCluster/cli/releases/download/v0.0.2/ovc-linux"
    sha256 "8d618e559b0f59fd9ee543e683a8c61e07547bf2d4d8d315a7e8418102caef2e"
  end

  def install
    if OS.mac?
      bin.install "ovc-darwin" => "ovc"
    elsif OS.linux?
      bin.install "ovc-linux" => "ovc"
    end
  end

  test do
    system "#{bin}/ovc", "version"
  end
end

