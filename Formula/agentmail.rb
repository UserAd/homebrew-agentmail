class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.3.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.7/agentmail-darwin-arm64"
      sha256 "738fc4d44b181a2c01f0450038961f714c11f71b4422a5a1adec846ee9cb7092"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.7/agentmail-darwin-amd64"
      sha256 "f3808d731469430a6121f7a101aedd2e76925e90e4b99216ed1c5f7366c72204"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.7/agentmail-linux-amd64"
      sha256 "70011e130287da818ed3f8cfc8c1f461ea6db2e7a36bf5eb99a8466e86469062"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.7/agentmail-linux-arm64"
      sha256 "649f90a50aa1a282d465f8db739ab82936d1d862c5a7a9793a1cb94b43f8ff58"
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
