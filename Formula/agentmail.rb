class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.3.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.5/agentmail-darwin-arm64"
      sha256 "17cbbfdf29fb2d154a024890bbde733c85ee5fff3f7ad07395850ee4434995db"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.5/agentmail-darwin-amd64"
      sha256 "fbcaa70f4d966069afdf1ee4a4b191c917e3dbd053cb5ea55a1ee3f92e71b4b5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.5/agentmail-linux-amd64"
      sha256 "221893033cc99b62b62d200a213f6275c179c4c4a0e8358b981e85af537d623e"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.5/agentmail-linux-arm64"
      sha256 "8cb0e10632c97ee795b46c0de1de0bc9fa9866c1c468860c0bb891fb71cbd2b0"
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
