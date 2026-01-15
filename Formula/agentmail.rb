class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "1.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.4/agentmail-darwin-arm64"
      sha256 "6d833579bb111d633178ec35f1b1ff4c02f3e27625913f7755d1d32f6383b9ad"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.4/agentmail-darwin-amd64"
      sha256 "1f06d124584b177fdfb6c01019e96e5b867bfc05050518b84c8089fc0ce93acf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.4/agentmail-linux-amd64"
      sha256 "9fd6f9bcd7ee616730889affdacdbaeebed7831345ebe0536b69e4066db66595"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.4/agentmail-linux-arm64"
      sha256 "94ac031aaa34ce97ba32bd79d73a9cadea407dfa0789c272de71e882e6b5d665"
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
