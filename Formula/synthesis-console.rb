class SynthesisConsole < Formula
  desc "Local project console for the Synthesis ecosystem"
  homepage "https://synthesiswork.org/download/"
  url "https://github.com/synthesisengineering/synthesis-console/releases/download/v1.6.2/synthesis-console-1.6.2.tar.gz"
  sha256 "0a7cec07ba6265e8203952e203f2434967c538c8e742aecc45aa5727d606e938"
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
    assert_match "1.6.2", shell_output("#{bin}/synthesis-console --version")
    assert_match "autostart", shell_output("#{bin}/synthesis-console --help")
  end
end
