class Ovc < Formula
desc "CLI to install the virtual-cluster-operator Helm chart"
homepage "https://github.com/OpenVirtualCluster/cli"
version ""

if OS.mac?
  if Hardware::CPU.intel?
    url "https://github.com/OpenVirtualCluster/cli/releases/download//ovc-darwin-amd64"
    sha256 "2f7a735bb3551b395c628b828e281996906db586c41b7159ff518002d59c1e3f"
  elsif Hardware::CPU.arm?
    url "https://github.com/OpenVirtualCluster/cli/releases/download//ovc-darwin-arm64"
    sha256 "e5576915a77aa096357dbe575c998cf6e05425c5bed5b2d458148791f1190fc1"
  end
elsif OS.linux?
  if Hardware::CPU.intel?
    url "https://github.com/OpenVirtualCluster/cli/releases/download//ovc-linux-amd64"
    sha256 "d61b5f054fe7b74cbcd6f44820ffaed7acf5a0646d01c15c04839a8556c8490e"
  elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/OpenVirtualCluster/cli/releases/download//ovc-linux-arm64"
    sha256 "18ba2c99bda45805763b10f852190ad85723564a889e8a7c779c04f938f3b445"
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
