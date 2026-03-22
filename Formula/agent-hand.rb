class AgentHand < Formula
  desc "A fast tmux-backed terminal session manager for AI coding agents"
  homepage "https://github.com/weykon/agent-hand"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/weykon/agent-hand/releases/download/v#{version}/agent-hand-aarch64-apple-darwin.tar.gz"
      sha256 "a8cd63a05af85a52a2ff36afcd8f02253d0670896082add79507385a8ae7920e"
    else
      url "https://github.com/weykon/agent-hand/releases/download/v#{version}/agent-hand-x86_64-apple-darwin.tar.gz"
      sha256 "cca783d4ce29376cb22a3dc804dfb1c9dce1e7797f04b2267874948788ff19db"
    end
  end

  on_linux do
    url "https://github.com/weykon/agent-hand/releases/download/v#{version}/agent-hand-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6e7b90e8a05d775ea127f1e6c1c811a02116850f22900c35c98b65e2fa800b89"
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
