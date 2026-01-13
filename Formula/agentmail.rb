class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.3/agentmail-darwin-arm64"
      sha256 "9a607cd57ad5181c06c7974c33167acfa67169f68a0b5c5eedd1fafd44aa4e20"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.3/agentmail-darwin-amd64"
      sha256 "1a93bf85f11346de3f71f7f20fb6df45e2e54ff5de4b84c074e334d73c3c3761"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.3.3/agentmail-linux-amd64"
      sha256 "bf6e4dd786218faaee71f8d6c003d5bcc37a6fb873371ea244485054f70c02be"
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
