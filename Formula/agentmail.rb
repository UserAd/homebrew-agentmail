class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.2/agentmail-darwin-arm64"
      sha256 "3539140e68c9a38030c38300cb67079f9c00d2a88b379c79fd10376a30e6df01"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.2/agentmail-darwin-amd64"
      sha256 "b4c41cbab5a0882565c374e8c5aa91d862a6702690a05dc39c138da990fc71d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.2/agentmail-linux-amd64"
      sha256 "4d7e90f79e5cb717166aa783314750b96c8bb54891347118e44fae45f2227178"
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
