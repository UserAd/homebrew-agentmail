class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.2.4/agentmail-darwin-arm64"
      sha256 "a579d4302dabeddffbdc2d778abb8867deef96a1188df55ba7eb59f870d3e2c6"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.2.4/agentmail-darwin-amd64"
      sha256 "0d9cb61d338b87588f690fe298a4b929c2449cf26ecb3123acee1a5140217091"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.2.4/agentmail-linux-amd64"
      sha256 "b4980eef6fffd6f0c4c1318b7ed2eee180b2146044c9ca6a29a682f18ba10b68"
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
