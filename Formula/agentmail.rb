class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "1.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.5/agentmail-darwin-arm64"
      sha256 "4a63174adc15e5a535031bedd4e2114c983c4b3d4ddba7c770056c3989143c91"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.5/agentmail-darwin-amd64"
      sha256 "a65b07cf8fda76a4f70f444877579ca6fe5f62b445bf4822ea3abde4d0783517"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.5/agentmail-linux-amd64"
      sha256 "07f5bbd029539b728c84594f78da44b1fc8cd8571ded14587e4a5088465b9f65"
    end
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v1.0.5/agentmail-linux-arm64"
      sha256 "804190009de1bb77a031378ceacab0a1b579748f2ed0811689e31e408df7b856"
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
