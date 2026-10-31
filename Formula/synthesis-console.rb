class SynthesisConsole < Formula
  desc "Local project console for the Synthesis ecosystem"
  homepage "https://synthesiswork.org/download/"
  url "https://github.com/synthesisengineering/synthesis-console/releases/download/v3.0.0/synthesis-console-3.0.0.tar.gz"
  sha256 "641bb17d1ea97fb8d58a7c86ce932ce81a7d70e38df98ccac8357ecc173904e6"
  license "Apache-2.0"
  depends_on "oven-sh/bun/bun"
  depends_on "git"
  def install
    libexec.install Dir["*"]
    (bin/"synthesis-console").write_env_script libexec/"bin/synthesis-console",
      PATH: "#{Formula["oven-sh/bun/bun"].opt_bin}:$PATH"
  end
  test do
    assert_match "3.0.0", shell_output("#{bin}/synthesis-console --version")
    assert_match "autostart", shell_output("#{bin}/synthesis-console --help")
  end
end
