class SynthesisConsole < Formula
  desc "Local project console for the Synthesis ecosystem"
  homepage "https://synthesiswork.org/download/"
  url "https://github.com/synthesisengineering/synthesis-console/releases/download/v3.0.1/synthesis-console-3.0.1.tar.gz"
  sha256 "64417d16e8b5426b7b9401e2c8a05b89dcde388c7259978fe084f5742332713d"
  license "Apache-2.0"
  depends_on "oven-sh/bun/bun"
  depends_on "git"
  def install
    libexec.install Dir["*"]
    (bin/"synthesis-console").write_env_script libexec/"bin/synthesis-console",
      PATH: "#{Formula["oven-sh/bun/bun"].opt_bin}:$PATH"
  end
  test do
    assert_match "3.0.1", shell_output("#{bin}/synthesis-console --version")
    assert_match "autostart", shell_output("#{bin}/synthesis-console --help")
  end
end
