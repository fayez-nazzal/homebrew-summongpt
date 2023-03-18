require "language/node"

class Summongpt < Formula
  desc "Summon the power of ChatGPT using a keyboard shortcut."
  homepage "https://github.com/fayez-nazzal/summongpt"
  head "https://github.com/fayez-nazzal/summongpt.git", branch: "main"
  version "HEAD"

  depends_on "rust" => :build
  depends_on "node"

  def install
    if build.head?
      ohai "Current working directory: #{Dir.pwd}"
      Dir.chdir(buildpath) do
        ohai "Changed to buildpath: #{Dir.pwd}"
        ENV["CI"] = "true"
        system "npm", "install", *Language::Node.std_npm_install_args(libexec)
        system "npm", "install", "pnpm"
        system "npm", "install"
        system "npm", "run", "build"
        system "npm", "run", "tauri", "build", "--", "-b", "app"
        prefix.install "src-tauri/target/release/bundle/macos/SummonGPT.app"
        ohai "prefix #{prefix}"
        bin.install_symlink prefix/"SummonGPT.app/Contents/MacOS/SummonGPT"
      end
    end
  end
end

