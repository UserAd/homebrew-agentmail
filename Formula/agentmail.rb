class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.2.0/agentmail-darwin-arm64"
      sha256 "706c4528216d4fa473097d98618ca24d97d75236d954da60f484977fdd61afda"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.2.0/agentmail-darwin-amd64"
      sha256 "8f8d3506d2a83b08da7333845e8ac486610d6a25dd62fabc1c82ac7d0886db87"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.2.0/agentmail-linux-amd64"
      sha256 "b118538198d341fe1d2995a698d0fde65df1a0813bfe92259b89977d200543b1"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.2.0/agentmail-linux-arm64"
      sha256 "f8ecdd9c0511009183245d4b5079b2c0433332f5ce8bc14855bc0e9e36f77860"
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
