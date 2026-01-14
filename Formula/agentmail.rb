class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.0/agentmail-darwin-arm64"
      sha256 "a22fe08a3b70719a7e15e7164b3e5a3e57b67ede16e6b31ca409858a89cdb2bc"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.0/agentmail-darwin-amd64"
      sha256 "bb3293ec7cceb33336b8ec8d7efc0d5298212ed196058a5afef3463319c947c1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.0/agentmail-linux-amd64"
      sha256 "d18306837fcf3ba0582c63880a5d172b67b186ea8fe1d30c0a9bf492da064134"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.0/agentmail-linux-arm64"
      sha256 "450933656a748445c52a2519e77f8f28ab3cffc7754aacb0e541a75c15981456"
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
