class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.1.1/agentmail-darwin-arm64"
      sha256 "38e669022715fc4a138aba958cc75df22e3e5eb8da261f92fa0503e8ef00b708"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.1.1/agentmail-darwin-amd64"
      sha256 "06c628555575a27856e0b94b3b18e9076724d8ca4c6157b2b3ab4106ff4e008d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.1.1/agentmail-linux-amd64"
      sha256 "208469c58739f5464cba4e7f0f3d5d1c2f3ac2208e2005a00ed930120818851b"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.1.1/agentmail-linux-arm64"
      sha256 "772b7f3d9fa8e613fe8257712e8c553a67d7fcd0ca206ed0c503caebb1a79be9"
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
