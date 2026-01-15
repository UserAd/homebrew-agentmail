class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "1.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.6/agentmail-darwin-arm64"
      sha256 "8db0abc7bcd67b98a078345314f663051e75329a9e275f15d3e082c9d1475721"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.6/agentmail-darwin-amd64"
      sha256 "f9ffd6857d60352c0f82d1e71e041cb0bcb9ce29474e313efa085ae18c858790"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.6/agentmail-linux-amd64"
      sha256 "2b5928ef7585b16db4b2613e6430783e0d1737cd2de9749fefd3185adab8a624"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.6/agentmail-linux-arm64"
      sha256 "b658eb841457286f26282545a8416c05eacb7dc37ed790432a74fb62c108b1de"
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
