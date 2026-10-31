class Slopcheck < Formula
  desc "Inspect writing quality with your chosen model provider"
  homepage "https://tools.synthesiswriting.org/slopcheck/"
  url "https://github.com/synthesisengineering/synthesis-slopcheck/releases/download/v0.2.0/slopcheck-0.2.0.tar.gz"
  sha256 "135624c8bb88c781834aa7ab92504c9419a55df91f58f65399198af83bee18a5"
  license "MIT"
  depends_on "python@3.12"

  def install
    libexec.install Dir["cli/*"]
    (bin/"slopcheck").write <<~SHELL
      #!/bin/sh
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/slopcheck.py" "$@"
    SHELL
    chmod 0755, bin/"slopcheck"
  end

  test do
    assert_match "--provider anthropic", shell_output("#{bin}/slopcheck --list-models")
  end
end
