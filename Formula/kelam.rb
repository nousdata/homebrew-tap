# Kelam CLI — build and run voice AI agents from the terminal. https://kelam.sh
#
# Tap-style formula: the sdist named by `url` is installed into a private virtualenv,
# and pip resolves the dependencies (all pure-python or prebuilt wheels) from PyPI at
# install time. That keeps a version bump to two lines (url + sha256) — the release
# workflow in nousdata/kelam rewrites them automatically on every tagged release.
class Kelam < Formula
  desc "Build and run voice AI agents from the terminal"
  homepage "https://kelam.sh"
  url "https://files.pythonhosted.org/packages/6d/62/25cb9017fe8902907daf52561d946ea49eb9038daf9914301418aff52d90/kelam-0.43.0.tar.gz"
  sha256 "06d30e8e9ab04580353b52ec316f6a49ae980806164b7c20ded8646623655232"

  depends_on "python@3.13"

  def install
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "venv", libexec
    system libexec/"bin/pip", "install", buildpath.to_s
    bin.install_symlink libexec/"bin/kelam"
  end

  test do
    assert_match "voice AI agents", shell_output("#{bin}/kelam --help")
  end
end
