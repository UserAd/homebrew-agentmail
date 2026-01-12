class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.5/agentmail-darwin-arm64"
      sha256 "0b236e76277815c9d4ecd1efdfc416bb27bb76d2ce84d76ae1aa5ca194e19fba"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.5/agentmail-darwin-amd64"
      sha256 "e6d51b508375820e4a0bcbf657a0bc0b63a78a5891003f1c601e35eb48db9967"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.5/agentmail-linux-amd64"
      sha256 "2c9bb56c56c4d8af7b933dd3f81a46f179c518cf2a8b237f7dd68d675f22a439"
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
