class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.4/agentmail-darwin-arm64"
      sha256 "32245d0fa9bffce6695b8b14a296fe21b8c2df94e7abf7ea5f6acd42e9029a94"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.4/agentmail-darwin-amd64"
      sha256 "323a4fbae10a4ce96431d6ecb15ff488b50aa1dfc2f4c0104448a6dea439cbdc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.4/agentmail-linux-amd64"
      sha256 "635fefc0de02691703dcdc8bc0b98244cb604f1b92ad70bff0a3d7e60dae3555"
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
