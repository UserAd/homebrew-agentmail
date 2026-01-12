class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.6/agentmail-darwin-arm64"
      sha256 "cbb4cc8a7c33de0a43ed4957504e4c14445f39597f0cae77d6510515c9f37a04"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.6/agentmail-darwin-amd64"
      sha256 "e60404077d0135efcae8337303ea1fd6f0f314277f1c5c9673ec3925ad68cc03"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.6/agentmail-linux-amd64"
      sha256 "284883abe100d22e91cc999ffd9d3409e7ab6a8fdb482c4bc13318ee9e2a8890"
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
