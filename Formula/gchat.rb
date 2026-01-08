class Gchat < Formula
  desc "Google Chat CLI - Send messages from the command line"
  homepage "https://github.com/chadsaun/gchat"
  url "https://files.pythonhosted.org/packages/source/g/gchat-cli/gchat_cli-0.2.1.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "MIT"

  depends_on "pipx"
  depends_on "python@3.12"

  def install
    system "pipx", "install", "gchat-cli", "--pip-args=--no-cache-dir"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/gchat"
  end

  def caveats
    <<~EOS
      To get started, run:
        gchat init

      You'll need OAuth credentials from Google Cloud Console.
      See: https://github.com/chadsaun/gchat#quick-start
    EOS
  end

  test do
    assert_match "Google Chat CLI", shell_output("#{bin}/gchat --help")
  end
end
