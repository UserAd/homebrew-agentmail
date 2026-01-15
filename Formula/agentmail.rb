class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "1.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.7/agentmail-darwin-arm64"
      sha256 "04ca3897d688719cb9df748382f282288b99131e05a3a92e838fd44ec8dece67"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.7/agentmail-darwin-amd64"
      sha256 "b96f1f329add809c297eb386e2f585a2c565d432b4f12bc4eaf31ca6906b5ae8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.7/agentmail-linux-amd64"
      sha256 "5ec07a5f72cbbdbdfa179fcebd7562ce8f06596b159ea439aeb71d54e0607a35"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.7/agentmail-linux-arm64"
      sha256 "babd278828ac9646ae3b0fe801fe35ee0b60ee0c44c84a73fdd74abdc05466e0"
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
