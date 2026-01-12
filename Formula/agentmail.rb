class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.1.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.9/agentmail-darwin-arm64"
      sha256 "618fe1c792c3246c71006c1b669939b59019ca1a51112bb64ccfc7ab3095ff51"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.9/agentmail-darwin-amd64"
      sha256 "12302c2ae1beb7016b6267ae94245405fb664ce6186908c8fd0ed05906293cf8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.9/agentmail-linux-amd64"
      sha256 "7247b05a2f4c8fd95d2cb09d6c6c6681088fb22cd66d845dd2c1afb671e4471a"
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
