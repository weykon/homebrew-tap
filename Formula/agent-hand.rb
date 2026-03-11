class AgentHand < Formula
  desc "A fast tmux-backed terminal session manager for AI coding agents"
  homepage "https://github.com/weykon/agent-hand"
  version "0.3.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/weykon/agent-hand/releases/download/v#{version}/agent-hand-aarch64-apple-darwin.tar.gz"
      sha256 "57a8184526dfb75a4c048de07033a578229de67a24b7b592c455a813f697e3fe"
    else
      url "https://github.com/weykon/agent-hand/releases/download/v#{version}/agent-hand-x86_64-apple-darwin.tar.gz"
      sha256 "3f95853b15f235cd3c3e8e0d8d2c082bc383c970eae96d4842ba714c821eeefb"
    end
  end

  on_linux do
    url "https://github.com/weykon/agent-hand/releases/download/v#{version}/agent-hand-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f088235a460d02a0a1739a0b5c01d2040293ef5de21aacfa073e98a7fcbc1fcd"
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
