class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.1.0/agentmail-darwin-arm64"
      sha256 "fd5474490beb2a8d1f91a440e86538dc834605ce7e63129eac1f3a28a877439f"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.1.0/agentmail-darwin-amd64"
      sha256 "6be91d81b33d06a04abbb6db685190a94094c8a27b8909bc06ca739ccd292e91"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.1.0/agentmail-linux-amd64"
      sha256 "63fd87c4f4bddc327512c6356ab412f9cbfe98df625a2739c57c3c229507ec93"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.1.0/agentmail-linux-arm64"
      sha256 "99707d2080e1876d12ce195588ca39e21d0128b643b42206283ac1548386894f"
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
