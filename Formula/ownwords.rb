class Ownwords < Formula
  desc "Own your words: portable WordPress and Markdown authoring tools"
  homepage "https://github.com/synthesiswriting/ownwords"
  url "https://github.com/synthesiswriting/ownwords/releases/download/v2.0.0/ownwords-2.0.0.tgz"
  sha256 "b5b97fe13fc921c36bea8e6018a426760748d561bb7752a540a413b0cbc1d873"
  license "MIT"
  depends_on "node"
  def install
    libexec.install Dir["*"]
    (bin/"ownwords").write_env_script libexec/"bin/ownwords.js",
      PATH: "#{Formula["node"].opt_bin}:$PATH"
  end
  test do
    assert_match "ownwords v2.0.0", shell_output("#{bin}/ownwords --version")
    (testpath/"article.html").write "<html><body><article><h1>Fixture article</h1><p>Retained author words.</p></article></body></html>"
    system bin/"ownwords", "convert", "article.html", "article.md"
    assert_match "Retained author words", (testpath/"article.md").read
  end
end
