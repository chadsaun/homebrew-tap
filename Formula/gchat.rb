class Gchat < Formula
  desc "Google Chat CLI - Send messages from the command line"
  homepage "https://github.com/chadsaun/gchat"
  url "https://files.pythonhosted.org/packages/source/g/gchat-cli/gchat_cli-0.1.0.tar.gz"
  sha256 "6cf3eeb13c46fb2e3c8e71dcc5b07515492356e716a53b1c27d73468c58cb68a"
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
