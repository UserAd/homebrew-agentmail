class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.1/agentmail-darwin-arm64"
      sha256 "911c8123b8b1b905a2e3fb91fc3d72e6e0f54600f967b07451120de45fb96f01"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.1/agentmail-darwin-amd64"
      sha256 "2b8c448308b3305600f111ac77fc7edfb3f8306770043013d3f4ac356266aaa4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.1/agentmail-linux-amd64"
      sha256 "ec5399d6d60a243882711063778e6717ae8f9948f3e772951d27b66dca2707f4"
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
