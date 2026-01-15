class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "1.0.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.8/agentmail-darwin-arm64"
      sha256 "e577ea41b5f7a031a0f949babba225a5a2f0542efb8508a8bfc056c02e7f87e2"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.8/agentmail-darwin-amd64"
      sha256 "87c013c2b89ecac7ff8211d1d39d9ef6cafdc65e4fa11036da18c9de63bedf70"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.8/agentmail-linux-amd64"
      sha256 "53c3971ee3f74e66178f8029c3ef519ec9ced8948cd519de948e9de477353c23"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.8/agentmail-linux-arm64"
      sha256 "0996bce8fe667fca9721b6f8dbf714f4c1998c4f30c4e9d8b279ab31112a0e30"
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
