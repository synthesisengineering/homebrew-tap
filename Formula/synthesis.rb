class Synthesis < Formula
  desc "Synthesis work system: skills, guards and project coordination for AI coding agents"
  homepage "https://synthesiswork.org/download/"
  url "https://github.com/synthesisengineering/synthesis-skills/archive/refs/tags/v5.9.0.tar.gz"
  sha256 "85fce61cea98398af7772f513a971a9161b10c2778f388de4af9e4658c45e796"
  license "Apache-2.0"
  depends_on "git"

  # v5 installs its own `synthesis` command (~/.local/bin/synthesis, linked to the runtime the
  # plugin keeps current), so this formula ships only the launcher that runs the onboarding.
  # A second `synthesis` here would shadow or diverge from the runtime the harnesses use.
  def install
    libexec.install "onboard.sh"
    (bin/"synthesis-onboard").write <<~SH
      #!/bin/sh
      exec /bin/sh "#{libexec}/onboard.sh" "$@"
    SH
  end

  def caveats
    <<~EOS
      Install the plugin in Claude Code, Codex and Muse, the runtime and the `synthesis` command:
        synthesis-onboard
      Then restart each app, and approve the synthesis hooks in Codex (/hooks) and in Muse
      (muse plugins approve synthesis-skills). `synthesis doctor` checks the result.
    EOS
  end

  test do
    assert_predicate libexec/"onboard.sh", :exist?
    assert_match "onboard.sh", (bin/"synthesis-onboard").read
  end
end
