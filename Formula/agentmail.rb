class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.3.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.4/agentmail-darwin-arm64"
      sha256 "78926f2f47818cc4b654650cdc957bfbad4b46a98a04ff2293015f1ecd10f44d"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.4/agentmail-darwin-amd64"
      sha256 "f64409f9a73a44a1a4b2bc9f218b53f346be70fef3c37f55d4e407b6fb49af97"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.4/agentmail-linux-amd64"
      sha256 "37dd25e094791434cef6f991055ad360216302c0a2485912c106b39624b3c97b"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.4/agentmail-linux-arm64"
      sha256 "5b0add0e4c0b4bce9b9f38482546620d5840910960f1f26987786ce9ba3966d8"
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
