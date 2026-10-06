class SynthesisConsole < Formula
  desc "Local project console for the Synthesis ecosystem"
  homepage "https://synthesiswork.org/download/"
  url "https://github.com/synthesisengineering/synthesis-console/releases/download/v2.0.0/synthesis-console-2.0.0.tar.gz"
  sha256 "9a1e713932b207a1297ee015e90e65151b9e8f3f3b2d3ce1c747a7d0a2a2bd73"
  license "Apache-2.0"
  depends_on "oven-sh/bun/bun"
  depends_on "git"
  def install
    libexec.install Dir["*"]
    (bin/"synthesis-console").write_env_script libexec/"bin/synthesis-console",
      PATH: "#{Formula["oven-sh/bun/bun"].opt_bin}:$PATH"
  end
  test do
    assert_match "2.0.0", shell_output("#{bin}/synthesis-console --version")
    assert_match "autostart", shell_output("#{bin}/synthesis-console --help")
  end
end
