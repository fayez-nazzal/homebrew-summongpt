class Summongpt < Formula
  desc "Summon the power of ChatGPT using a keyboard shortcut."
  homepage "https://github.com/fayez-nazzal/summongpt"
  head "https://github.com/fayez-nazzal/summongpt.git"

  depends_on "rust"
  depends_on "node"

  def install
    system "npm", "install"
    system "npm", "run", "build"
    system "npm", "run", "tauri", "build"
    prefix.install Dir["src-tauri/target/release/bundle/macos/summongpt"]
    bin.install_symlink prefix/"#{prefix.basename}.app/Contents/MacOS/summongpt"
  end
end

