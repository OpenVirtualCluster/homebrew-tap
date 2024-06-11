class Ovc < Formula
desc "CLI to install the virtual-cluster-operator Helm chart"
homepage "https://github.com/OpenVirtualCluster/cli"
version "v0.0.0"

if OS.mac?
  if Hardware::CPU.intel?
    url "https://github.com/OpenVirtualCluster/cli/releases/download/v0.0.0/ovc-darwin-amd64"
    sha256 "607cd7e17e3dfcdc293d9ff50758c3125a3f8bf6af0e78fb28bda04339a20c45"
  elsif Hardware::CPU.arm?
    url "https://github.com/OpenVirtualCluster/cli/releases/download/v0.0.0/ovc-darwin-arm64"
    sha256 "4e4b7bb21664268045dd3efe2653091ee682810740bcf48ab684033817630783"
  end
elsif OS.linux?
  if Hardware::CPU.intel?
    url "https://github.com/OpenVirtualCluster/cli/releases/download/v0.0.0/ovc-linux-amd64"
    sha256 "0787210f68b44fc63f1f6d76ff5bf6a7ae8fb1587f5771e639c7567f441644cc"
  elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/OpenVirtualCluster/cli/releases/download/v0.0.0/ovc-linux-arm64"
    sha256 "e62699eb866de5d125f968d8c88e372ab5abed5b025903b96939c60d50d5906d"
  end
end

def install
if OS.mac?
  if Hardware::CPU.intel?
    bin.install "ovc-darwin-amd64" => "ovc"
  elsif Hardware::CPU.arm?
    bin.install "ovc-darwin-arm64" => "ovc"
  end
elsif OS.linux?
  if Hardware::CPU.intel?
    bin.install "ovc-linux-amd64" => "ovc"
  elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    bin.install "ovc-linux-arm64" => "ovc"
  end
end
end

test do
  system "#{bin}/ovc", "version"
end
end
