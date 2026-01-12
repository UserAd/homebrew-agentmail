class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.2.1/agentmail-darwin-arm64"
      sha256 "3470130ffccda3951416ef48c6548782e1819ab0d173565ad702bcd09a837fa1"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.2.1/agentmail-darwin-amd64"
      sha256 "e33701fa295171a80f52b6a751de83c5ac57e3b7ec7b9da82deccf8ed9ebcd32"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.2.1/agentmail-linux-amd64"
      sha256 "2cf5b5756ea2b34314e330be6f72209b06a05553d81be79e5a3111aa6c453efd"
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
