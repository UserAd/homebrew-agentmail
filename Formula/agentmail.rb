class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.2.0/agentmail-darwin-arm64"
      sha256 "fc5a13b7efa2114178c0af2700d46668f8d79898303e537bb53e697068903520"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.2.0/agentmail-darwin-amd64"
      sha256 "35b9dae90e47b5d9e068bd11573780f1a966fb65bd771dada04806f236522a2c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.2.0/agentmail-linux-amd64"
      sha256 "87087f5966dd5ae9ac8eed9d6970b2714910c01df6303fbb70963c90dcaaa9cf"
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
