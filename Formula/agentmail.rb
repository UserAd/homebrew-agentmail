class Agentmail < Formula
  desc "Inter-agent communication for tmux sessions"
  homepage "https://github.com/UserAd/AgentMail"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.7/agentmail-darwin-arm64"
      sha256 "df3cdd079617dbdb32b96d9d6432742b9a6016135460f0b78a4f6617865a9372"
    end
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.7/agentmail-darwin-amd64"
      sha256 "db69aecdf50b6e8a8a41ac209889a04f3d9dfc868a007aa7609b08cd26ea1aee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/UserAd/AgentMail/releases/download/v0.1.7/agentmail-linux-amd64"
      sha256 "a86f65f4646019d986bde69a77c623417836772de210f9f251a83bc117f0698e"
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
