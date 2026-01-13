class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.0/agentmail-darwin-arm64"
      sha256 "97d07ddafd3ddf325dd3e6d5407975b1ffaa69b129feadfce5cc20f59ad591b0"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.0/agentmail-darwin-amd64"
      sha256 "73e4c30e9466015f43bed6b17f462e4accd35fdbea53803fa0e7d5e2e6d4699e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.0/agentmail-linux-amd64"
      sha256 "19f35ca689233edf2e421fadfd2b90ecbdebb51e89779e75a456ee80e2132b5c"
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
