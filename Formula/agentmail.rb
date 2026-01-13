class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.3.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.6/agentmail-darwin-arm64"
      sha256 "8be3ee4e46b52bca5ec9614e05d3ab8c0f545635b7b7673fc341f89cf0db8832"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.6/agentmail-darwin-amd64"
      sha256 "de5857da1093f04e29ecdeab2a81ade004aa002a2d84b90b7dfdf83b500f4b51"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.6/agentmail-linux-amd64"
      sha256 "effe1e5b6adb367f67e4325f0b20873bc78510c923915773e32506b310e4983c"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.6/agentmail-linux-arm64"
      sha256 "6c21baa30fa6f0b426ab61778ba4a1296e4f38e2cf28adcc78cc03ebeb6326d1"
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
