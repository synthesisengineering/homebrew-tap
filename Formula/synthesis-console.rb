class SynthesisConsole < Formula
  desc "Local project console for the Synthesis ecosystem"
  homepage "https://synthesiswork.org/download/"
  url "https://github.com/synthesisengineering/synthesis-console/releases/download/v1.5.1/synthesis-console-1.5.1.tar.gz"
  sha256 "62e721b15f8697db95abfcf02985633ecb8236338938604981289eedd1572231"
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
    assert_match "1.5.1", shell_output("#{bin}/synthesis-console --version")
    assert_match "autostart", shell_output("#{bin}/synthesis-console --help")
  end
end
