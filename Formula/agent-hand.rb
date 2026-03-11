class AgentHand < Formula
  desc "A fast tmux-backed terminal session manager for AI coding agents"
  homepage "https://github.com/weykon/agent-hand"
  version "0.3.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/weykon/agent-hand/releases/download/v#{version}/agent-hand-aarch64-apple-darwin.tar.gz"
      sha256 "1d49d6817412da9b99249837aefcb74f852b1d30b5de4fa9face6375321661c4"
    else
      url "https://github.com/weykon/agent-hand/releases/download/v#{version}/agent-hand-x86_64-apple-darwin.tar.gz"
      sha256 "cf7aa740607b682be3e13c14428a285007776e258f224932ede5e13a0c768940"
    end
  end

  on_linux do
    url "https://github.com/weykon/agent-hand/releases/download/v#{version}/agent-hand-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a60a327a56e445f5866f254275d77807123f21caf54e85956410969118db00ff"
  end

  depends_on "tmux"

  def install
    bin.install "agent-hand"
    bin.install "agent-hand-bridge" if File.exist?("agent-hand-bridge")
  end

  test do
    system "#{bin}/agent-hand", "--version"
  end
end
