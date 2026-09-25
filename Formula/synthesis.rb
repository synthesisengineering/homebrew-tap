class Synthesis < Formula
  desc "Verified installation and lifecycle for the Synthesis ecosystem"
  homepage "https://synthesiswork.org/download/"
  url "https://github.com/synthesisengineering/synthesis-skills/releases/download/v4.149.3/synthesis-4.149.3.tar.gz"
  sha256 "ae6c85f44035da1d4d8a5c76aaa3033509b6b7e88a5749d5bcf62a3125883f8f"
  license "Apache-2.0"
  depends_on "git"
  depends_on "python@3.12"
  def install
    libexec.install Dir["*"]
    (bin/"synthesis").write_env_script libexec/"bin/synthesis",
      SYNTHESIS_BOOTSTRAP_PYTHON: Formula["python@3.12"].opt_bin/"python3.12"
  end
  test do
    assert_match "4.149.3", shell_output("#{bin}/synthesis --version")
    assert_match "--profile", shell_output("#{bin}/synthesis --help")
  end
end
