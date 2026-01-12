class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.1.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.8/agentmail-darwin-arm64"
      sha256 "be4256a16028de3b9aabbd95d46b75317dfb59ac9466a6ca06bf120f964deb4e"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.8/agentmail-darwin-amd64"
      sha256 "03a2ddaa5afb8f17033516b058d987635394b160d176871b954453cb8b39d976"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.8/agentmail-linux-amd64"
      sha256 "ea0ea1a76ecc85bab06fcb1edc739fa9d969f9f13404782a5bdab5d806627f0b"
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
