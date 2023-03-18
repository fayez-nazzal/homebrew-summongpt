class Summongpt < Formula
  desc "A description of your Tauri application"
  homepage "https://github.com/your-username/summongpt"

  depends_on "rust"
  depends_on "node"

  def install
    system "npm", "install"
    system "npm", "run", "build"
    system "npm", "run", "tauri", "build"
    prefix.install Dir["src-tauri/target/release/bundle/macos/summongpt"]
    bin.install_symlink prefix/"#{prefix.basename}.app/Contents/MacOS/summongpt"
  end

  test do
    # Add a simple test if you like
  end
end

