class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.2/agentmail-darwin-arm64"
      sha256 "ec965598c7911d534ab0606c3ef1f27607ca1d470f7cbfe1057be607e6aae353"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.2/agentmail-darwin-amd64"
      sha256 "215038b767277128e3091f534bfcf72e1f9da5e0cd520ed7e68a3abeb24655fe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.2/agentmail-linux-amd64"
      sha256 "d3d24ea14491c8f3298f9bfeeed51ca0d61480b3679945167faae6f750faa0d9"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.2/agentmail-linux-arm64"
      sha256 "980d96d5260ed54b98ad7fddc8f138993474be37f7af4f217437071c4a35239e"
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
