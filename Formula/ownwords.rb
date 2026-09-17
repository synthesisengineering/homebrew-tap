class Ownwords < Formula
  desc "Own your words: portable WordPress and Markdown authoring tools"
  homepage "https://github.com/synthesiswriting/ownwords"
  url "https://github.com/synthesiswriting/ownwords/releases/download/v1.6.1/ownwords-1.6.1.tgz"
  sha256 "cbcb9cf6982a7ab2003970aec640b87a2a736c392a0452c00cf9d3f7942cc8da"
  revision 1
  license "MIT"
  depends_on "node"
  depends_on "git"
  depends_on "python@3.12"
  def install
    libexec.install Dir["*"]
    (bin/"ownwords").write_env_script libexec/"bin/ownwords.js",
      PATH: "#{Formula["node"].opt_bin}:#{Formula["git"].opt_bin}:$PATH",
      SYNTHESIS_BOOTSTRAP_PYTHON: "#{Formula["python@3.12"].opt_bin}/python3.12"
  end
  test do
    assert_match "ownwords v1.6.1", shell_output("#{bin}/ownwords --version")
    assert_match "setup", shell_output("#{bin}/ownwords --help")
  end
end
