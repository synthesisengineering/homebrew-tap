class Synthesis < Formula
  desc "Synthesis work system: skills, guards and project coordination for AI coding agents"
  homepage "https://synthesiswork.org/download/"
  url "https://github.com/synthesisengineering/synthesis-skills/archive/refs/tags/v5.7.0.tar.gz"
  sha256 "52a59cbbde4d12cb9e4543c8a4acff48196caa84a39e114851100dfd5215a1f6"
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
