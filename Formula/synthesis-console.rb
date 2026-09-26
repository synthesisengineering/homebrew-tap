class SynthesisConsole < Formula
  desc "Local project console for the Synthesis ecosystem"
  homepage "https://synthesiswork.org/download/"
  url "https://github.com/synthesisengineering/synthesis-console/releases/download/v1.5.2/synthesis-console-1.5.2.tar.gz"
  sha256 "1d67203a11f7e963979c84d2f6288741ba6eb5aa1a9e0cbcafe9e6e6b8e53dbc"
  license "Apache-2.0"
  depends_on "oven-sh/bun/bun"
  depends_on "git"
  depends_on "python@3.12"
  def install
    libexec.install Dir["*"]
    (bin/"synthesis-console").write_env_script libexec/"bin/synthesis-console",
      PATH: "#{Formula["oven-sh/bun/bun"].opt_bin}:$PATH",
      SYNTHESIS_BOOTSTRAP_PYTHON: Formula["python@3.12"].opt_bin/"python3.12"
  end
  test do
    assert_match "1.5.2", shell_output("#{bin}/synthesis-console --version")
    assert_match "autostart", shell_output("#{bin}/synthesis-console --help")
  end
end
