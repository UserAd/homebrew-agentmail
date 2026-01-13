class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.2.3/agentmail-darwin-arm64"
      sha256 "9232c333a0dda67a355d0684a66b1922e370df35814f6af72966448fd3435eb0"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.2.3/agentmail-darwin-amd64"
      sha256 "8d8a7ec51563f1849d740ce5f087dea8f52029d499fbe0c81226ab0ae9af01b2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.2.3/agentmail-linux-amd64"
      sha256 "dda5e20057466f769acdb47086d107c81bc73a4dbb28894ec9f6ca97d6f20ab4"
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
