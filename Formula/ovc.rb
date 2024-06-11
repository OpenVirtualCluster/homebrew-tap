class Ovc < Formula
desc "CLI to install the virtual-cluster-operator Helm chart"
homepage "https://github.com/OpenVirtualCluster/cli"
version ""

if OS.mac?
  if Hardware::CPU.intel?
    url "https://github.com/OpenVirtualCluster/cli/releases/download//ovc-darwin-amd64"
    sha256 "23f5a8629da6195d24f7103c3d9f21eb3e0caa0b5ba711051f26323d80d3ee85"
  elsif Hardware::CPU.arm?
    url "https://github.com/OpenVirtualCluster/cli/releases/download//ovc-darwin-arm64"
    sha256 "495696ed07a9e646788ae9c3d330b94b44994103fc22c7f59acd3b95bd0d7cc3"
  end
elsif OS.linux?
  if Hardware::CPU.intel?
    url "https://github.com/OpenVirtualCluster/cli/releases/download//ovc-linux-amd64"
    sha256 "65f749ab218bc4700f4b2cf1f2ac65a00b51ea4293eab360d9e593397122a13c"
  elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/OpenVirtualCluster/cli/releases/download//ovc-linux-arm64"
    sha256 "3964962138c10705c5ba01f4027bdd4536af5db584f1de00942a555bf7e5f891"
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
