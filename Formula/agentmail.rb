class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "1.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.2.2/agentmail-darwin-arm64"
      sha256 "cdba996af31547e7a3273a79f5b853acb98140f912272688122fba9b1b5e2931"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.2.2/agentmail-darwin-amd64"
      sha256 "405ee49cb9ba567a7f83ed00aa5eb67aaf8f134bdfbbd3b1f22fcc4b57e2d6f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.2.2/agentmail-linux-amd64"
      sha256 "8d38ad91202124ddba10d914e136c05b6ce6bb688922362304b250f789100bb1"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.2.2/agentmail-linux-arm64"
      sha256 "5a4eb59c138361e92538495dc263a894aa4208765fb81771891dc4682bc6ee72"
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
