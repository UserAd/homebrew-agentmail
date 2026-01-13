class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.1/agentmail-darwin-arm64"
      sha256 "118a85683c893985c4640a353e31bd024c857c351b0ef513ac864f858dc6bc47"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.1/agentmail-darwin-amd64"
      sha256 "1cb46c0ba8fc9e25dcbc6b8803c776df3c638291c964d272092da0938f366b0a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.1/agentmail-linux-amd64"
      sha256 "943230bf090d800e22f9fe8a46c3e486a364d66689810af492c6eac2a3563ea1"
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
