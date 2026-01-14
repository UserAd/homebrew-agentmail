class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.3/agentmail-darwin-arm64"
      sha256 "8cf9cf0795097dd0edc63692f758dc81f3ffd69e400977f9dfeee0602a423b91"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.3/agentmail-darwin-amd64"
      sha256 "2645ab9e901f40a1b2ede9f2a9790f326ebdfc1bb3dd01dcd155b80c537aec27"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.3/agentmail-linux-amd64"
      sha256 "b780824dd1896f20d285f77e0941ff94abaa2817207f5cb6f2b035566a735c55"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.3/agentmail-linux-arm64"
      sha256 "7e10157cec4231d02d257530079fd9d187d9641f1571d2bc85f28fcc6f766b9c"
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
