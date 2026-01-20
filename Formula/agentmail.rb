class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.2.1/agentmail-darwin-arm64"
      sha256 "6013f5d32b643371b5964809545b4411071cd387b99588d0a6d85f8eb53a4cd7"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.2.1/agentmail-darwin-amd64"
      sha256 "af10eb525872cb5201901e17efd4fb6c8ae2dcd7466a5573c0b4959eb17e1544"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.2.1/agentmail-linux-amd64"
      sha256 "e8e78b6adb85d72a4f69a715781933db39d176abb173f9ba1d534f5ad99de7f1"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.2.1/agentmail-linux-arm64"
      sha256 "4fb9f9051f223a5532f075680225163e769f8f77a4b88bd21dfefb7300dc5f45"
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
