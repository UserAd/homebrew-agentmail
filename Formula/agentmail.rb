class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.3.0/agentmail-darwin-arm64"
      sha256 "4cfde611a455f90da3e5c9488a5c4a82fcea0b62bcc6cb8e2871177975af8d5b"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.3.0/agentmail-darwin-amd64"
      sha256 "95c181e63e5fcdcbebe8f3bb5e1bc8e17fbe83dc19ff275d1bf55e0692997ebb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.3.0/agentmail-linux-amd64"
      sha256 "328bc5b467d3184ed42a7f28d89456dabfb3213728609b1baee75b9fc30dbcb5"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.3.0/agentmail-linux-arm64"
      sha256 "65f3c480ff1bdc38f8f8985bf33a10d985ee38c40821f50d797cf8c8591dbd48"
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
