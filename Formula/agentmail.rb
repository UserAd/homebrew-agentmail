class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "1.0.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.9/agentmail-darwin-arm64"
      sha256 "722d868f48bec00824fee15c182c10c4076e199051644c07cfc7d9e97cdf7104"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.9/agentmail-darwin-amd64"
      sha256 "28693d28b62f99a7992d4df7b94f45e2d7c0f058fa658082c083eb625cf208f8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.9/agentmail-linux-amd64"
      sha256 "670f460133ee1e393f62cf560d09315b02655f5cde9ab5bf1cb8021dc6f9f7bd"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.9/agentmail-linux-arm64"
      sha256 "d3890bee633121719910b51daf423d9c6a7a2c537d739f31f506f48f4e8f1d8e"
    end
  end

  def install
    if OS.mac?
      bin.install "agentmail-darwin-arm64" => "agentmail" if Hardware::CPU.arm?
      bin.install "agentmail-darwin-amd64" => "agentmail" if Hardware::CPU.intel?
    else
      bin.install "agentmail-linux-arm64" => "agentmail" if Hardware::CPU.arm?
      bin.install "agentmail-linux-amd64" => "agentmail" if Hardware::CPU.intel?
    end
  end

  test do
    assert_match "agentmail", shell_output("#{bin}/agentmail --help")
  end
end
