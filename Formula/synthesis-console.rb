class SynthesisConsole < Formula
  desc "Local project console for the Synthesis ecosystem"
  homepage "https://synthesiswork.org/download/"
  url "https://github.com/synthesisengineering/synthesis-console/releases/download/v2.1.0/synthesis-console-2.1.0.tar.gz"
  sha256 "bb9d5cc4cb45991051a1f70c2247f40368b91654c799deff0a5dafb552b4b4ac"
  license "Apache-2.0"
  depends_on "oven-sh/bun/bun"
  depends_on "git"
  def install
    libexec.install Dir["*"]
    (bin/"synthesis-console").write_env_script libexec/"bin/synthesis-console",
      PATH: "#{Formula["oven-sh/bun/bun"].opt_bin}:$PATH"
  end
  test do
    assert_match "2.1.0", shell_output("#{bin}/synthesis-console --version")
    assert_match "autostart", shell_output("#{bin}/synthesis-console --help")
  end
end
