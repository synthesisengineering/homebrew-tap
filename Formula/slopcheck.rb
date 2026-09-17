class Slopcheck < Formula
  desc "Inspect writing quality with your chosen model provider"
  homepage "https://tools.synthesiswriting.org/slopcheck/"
  url "https://github.com/synthesisengineering/synthesis-slopcheck/releases/download/v0.1.1/slopcheck-0.1.1.tar.gz"
  sha256 "036cfce24da5c66948f5c4e38ff233020d299bd3ecba524a1903afa48f3f4306"
  license "MIT"
  depends_on "python@3.12"
  depends_on "git"

  def install
    libexec.install Dir["cli/*"]
    (bin/"slopcheck").write <<~SHELL
      #!/bin/sh
      export SYNTHESIS_BOOTSTRAP_PYTHON="#{Formula["python@3.12"].opt_bin}/python3.12"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/slopcheck.py" "$@"
    SHELL
    chmod 0755, bin/"slopcheck"
  end

  test do
    assert_match "--provider anthropic", shell_output("#{bin}/slopcheck --list-models")
  end
end
