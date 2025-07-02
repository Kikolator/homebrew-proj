class ProjJumper < Formula
  desc "Jump quickly into project directories inside $DEV_ROOT"
  homepage "https://github.com/Kikolator/proj-jumper"
  url "https://github.com/Kikolator/proj-jumper/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "b98a7721cee82558fb8483d51d4a8535ca0df5a573d9fa364db40f65f66802e7"
  license "MIT"

  def install
    pkgshare.install Dir["*"]
  end

  def caveats
    <<~EOS
      Add the plugin to Oh My Zsh:

        ln -s #{opt_pkgshare} $ZSH_CUSTOM/plugins/proj-jumper
        sed -i '' 's/^plugins=(/&proj-jumper /' ~/.zshrc

      Then restart your shell or `source ~/.zshrc`.

      👉  **One‑time configuration**

          export PROJ_DEV_ROOT=/path/to/projects        # manual
          #‑‑OR‑‑
          proj config /path/to/projects                 # auto‑writes the line
    EOS
  end

  test do
    assert_match "proj", shell_output("zsh -c 'source #{pkgshare}/proj.plugin.zsh && which proj'")
  end
end
