class AgentHand < Formula
  desc "A fast tmux-backed terminal session manager for AI coding agents"
  homepage "https://github.com/weykon/agent-hand"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/weykon/agent-hand/releases/download/v#{version}/agent-hand-aarch64-apple-darwin.tar.gz"
      sha256 "ee79d5547919cf35eb24dc538c15b5ebb542cedcff547eb8d71df0d627cd718b"
    else
      url "https://github.com/weykon/agent-hand/releases/download/v#{version}/agent-hand-x86_64-apple-darwin.tar.gz"
      sha256 "448bd1f60802c416b2b5c11d1dd1aa6aaa68a9494dd1106b5df76981021c53fd"
    end
  end

  on_linux do
    url "https://github.com/weykon/agent-hand/releases/download/v#{version}/agent-hand-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "565cea9f18a38f69e359cf8de496f4b811d5076a86e3ff94a96482abac0835f6"
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
