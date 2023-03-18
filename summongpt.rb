class Summongpt < Formula
  desc "A description of your Tauri application"
  homepage "https://github.com/your-username/summongpt"
  url "https://github.com/your-username/summongpt/releases/download/v1.0.0/summongpt-v1.0.0.tar.gz"
  sha256 "1e57a452a094728c291bc42bf2bc7eb8d9fd8844d1369da2bf728588b46c4e75"

  depends_on "rust"
  depends_on "node"

  def install
    system "npm", "install"
    system "npm", "run", "build"
    system "npm", "run", "tauri", "build"
    bin.install "src-tauri/target/release/summongpt"
  end

  test do
    # Add a simple test if you like
  end
end

