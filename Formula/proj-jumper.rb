# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ProjJumper < Formula
  desc "Jump quickly into project directories inside $DEV_ROOT"
  homepage "https://github.com/Kikolator/proj-jumper"
  url "https://github.com/Kikolator/proj-jumper/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "850ac146c020e38005de163b30c514758a628adfb1ef5a489f8afa65751319c1"
  license "MIT"

  # depends_on "cmake" => :build

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    pkgshare.install Dir["*"]  # keep repo layout intact
  end

  def caveats
    <<~EOS
      Add the plugin to Oh My Zsh:

        ln -s #{opt_pkgshare} $ZSH_CUSTOM/plugins/proj-jumper
        sed -i '' 's/^plugins=(/&proj-jumper /' ~/.zshrc

      Then restart your shell or `source ~/.zshrc`.
    EOS
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test proj-jumper`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    assert_match "proj", shell_output("zsh -c 'source #{pkgshare}/proj.plugin.zsh && which proj'")
  end
end
