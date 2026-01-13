class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.2.2/agentmail-darwin-arm64"
      sha256 "5f1ea3c0ca964a52d0719472addf60b5184286b6020e359462cf311f81f479fc"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.2.2/agentmail-darwin-amd64"
      sha256 "612fcdc2937d582d1d70a6d6ba2e40e66b309e8ce020e5a6f5415afe5ca1582d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.2.2/agentmail-linux-amd64"
      sha256 "5ee2b5d058e53436a8af64bbe289cc1ab0081cb1a01ebbf81d7e434b8a79f703"
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
