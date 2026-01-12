class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.2/agentmail-darwin-arm64"
      sha256 "a578afce20bbd87c93e9e5a571c1dbf3d697268b39fe603ae23fe57bfc79e8a5"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.2/agentmail-darwin-amd64"
      sha256 "f7db6b0520169551a34ea7f8643fa6511996c6ffd0266c7bb96dcfd37e9f4706"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.2/agentmail-linux-amd64"
      sha256 "54a2a53314c14cb8f0c57bc1189a307771e949c42a6adc61ffbf4a36df361c9e"
    end
  end

  def install
    if OS.mac?
      bin.install "agentmail-darwin-arm64" => "agentmail" if Hardware::CPU.arm?
      bin.install "agentmail-darwin-amd64" => "agentmail" if Hardware::CPU.intel?
    else
      bin.install "agentmail-linux-amd64" => "agentmail"
    end
  end

  test do
    assert_match "agentmail", shell_output("#{bin}/agentmail --help")
  end
end
