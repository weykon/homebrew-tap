class AgentHand < Formula
  desc "A fast tmux-backed terminal session manager for AI coding agents"
  homepage "https://github.com/weykon/agent-hand"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/weykon/agent-hand/releases/download/v#{version}/agent-hand-aarch64-apple-darwin.tar.gz"
      sha256 "3ff8264174f6a5c7e33e6dc60535093ad04e83ecc82e880f6e5ed44014c1f5e9"
    else
      url "https://github.com/weykon/agent-hand/releases/download/v#{version}/agent-hand-x86_64-apple-darwin.tar.gz"
      sha256 "f3c545a0b2e124f400408e26e9c8dc765094de5ed1e36ceca24d7298112b5c52"
    end
  end

  on_linux do
    url "https://github.com/weykon/agent-hand/releases/download/v#{version}/agent-hand-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6f9e3993dfc36f9cbefe7e9c0f0b25c215289d8f44969dd9d80857c5c6936996"
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
