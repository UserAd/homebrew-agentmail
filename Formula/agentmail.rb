class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.3/agentmail-darwin-arm64"
      sha256 "fb3432e3d45dd94299e610eae4a04b5fa7f41a8a451939d693d271352efed8c7"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.3/agentmail-darwin-amd64"
      sha256 "24bc0726ccca65e664702c8bf3b68b30ac270a3ee8f1e37b8280f68da34f60b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.3/agentmail-linux-amd64"
      sha256 "2e201a4e1732e3be03dfa07d428268a9f64cea323711ccf3eadd60bc765d399b"
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
