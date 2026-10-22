class Aibox < Formula
  desc "Run Claude Code and Codex CLI in Apple container sandboxes on macOS"
  homepage "https://github.com/SimpleTang/ai-sandbox"
  url "https://github.com/SimpleTang/ai-sandbox/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  # Apple container is not declared as a dependency on purpose: `aibox setup` installs the
  # version this project has verified and avoids clashing with an existing .pkg install.
  depends_on arch: :arm64
  depends_on :macos

  def install
    # Image builds stage a context from the .dockerignore allowlist, so keep that dotfile too.
    libexec.install Dir["*"], ".dockerignore"
    bin.install_symlink libexec/"ai-box" => "aibox"
    bash_completion.install libexec/"ai-box-completion.sh" => "aibox"
  end

  def caveats
    <<~EOS
      aibox needs Apple container (macOS 26 on Apple silicon). Run the setup wizard first:
        aibox setup
      It installs the verified Apple container version if needed, writes ~/.aibox/aibox.conf
      and builds the images.

      zsh completion: the wizard can add it to ~/.zshrc, or add this line yourself:
        source #{opt_libexec}/ai-box-completion.sh

      After upgrading, run `aibox clip restart` if you use clipboard image pasting.
      User data lives in ~/.aibox and is not removed by `brew uninstall`.

      首次使用请运行 aibox setup(安装向导);用户数据在 ~/.aibox,卸载不会删除。
    EOS
  end

  test do
    assert_match "aibox #{version}", shell_output("#{bin}/aibox --version")
  end
end
