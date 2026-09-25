class Synthesis < Formula
  desc "Verified installation and lifecycle for the Synthesis ecosystem"
  homepage "https://synthesiswork.org/download/"
  url "https://github.com/synthesisengineering/synthesis-skills/releases/download/v4.149.1/synthesis-4.149.1.tar.gz"
  sha256 "2950c3b68bf78d8723323787069e0f3e9171cf7ec5005ff57bb34e0cd97ff199"
  license "Apache-2.0"
  depends_on "git"
  depends_on "python@3.12"
  def install
    libexec.install Dir["*"]
    (bin/"synthesis").write_env_script libexec/"bin/synthesis",
      SYNTHESIS_BOOTSTRAP_PYTHON: Formula["python@3.12"].opt_bin/"python3.12"
  end
  test do
    assert_match "4.149.1", shell_output("#{bin}/synthesis --version")
    assert_match "--profile", shell_output("#{bin}/synthesis --help")
  end
end
