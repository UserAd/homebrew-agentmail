class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.1/agentmail-darwin-arm64"
      sha256 "9d1a0ed1c11ce10548026eb001eb6aaee798fe7abf7b37145ae8719b6e37f602"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.1/agentmail-darwin-amd64"
      sha256 "8283db8123b281f23383123f0e6896e58a26b2d9cd83dc6abd2c9fd9e3ec46ec"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.1/agentmail-linux-amd64"
      sha256 "2fcc1b80eea0c5627ab0fa4104b4e2c50ada0537970968ad493d5252317400f9"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.1/agentmail-linux-arm64"
      sha256 "21ba954f3a14c128bcc139f9c0793a97ea8c7fce9f73a03c069df197ad89cffc"
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
