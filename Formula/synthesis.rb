class Synthesis < Formula
  desc "Verified installation and lifecycle for the Synthesis ecosystem"
  homepage "https://synthesiswork.org/download/"
  url "https://github.com/synthesisengineering/synthesis-skills/releases/download/v4.149.7/synthesis-4.149.7.tar.gz"
  sha256 "7be8eb092c370890c3ba4274121c04e1c51cb0db6e6213b3ef62854a5fe9af7f"
  license "Apache-2.0"
  depends_on "git"
  depends_on "python@3.12"
  def install
    libexec.install Dir["*"]
    (bin/"synthesis").write_env_script libexec/"bin/synthesis",
      SYNTHESIS_BOOTSTRAP_PYTHON: Formula["python@3.12"].opt_bin/"python3.12"
  end
  test do
    assert_match "4.149.7", shell_output("#{bin}/synthesis --version")
    assert_match "--profile", shell_output("#{bin}/synthesis --help")
  end
end
