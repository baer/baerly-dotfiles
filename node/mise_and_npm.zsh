# Put mise's shim dir at the front of PATH. Gusto's ~/.gusto/init.sh already runs
# `mise activate --shims`, but it does so before the path.zsh files load, so
# later prepends (notably homebrew/path.zsh adding /opt/homebrew/bin) shadow it.
# This file loads after every path.zsh, so re-prepending here keeps mise ahead of
# Homebrew and system binaries.
#
# We use shims rather than full `mise activate` so tool binaries resolve to the
# stable shim path (<data-dir>/mise/shims/<tool>). Shims are the portable
# mechanism: unlike `mise activate` (interactive shells only), they also resolve
# the right version from non-interactive callers — scripts, IDEs, and Gusto's
# gdev checks, which require `which bundler` to be the shim path. They resolve
# the per-directory version at exec time, so no chpwd hook is needed.
#
# XDG_DATA_HOME is set later (system/env.zsh), so mirror mise's default layout
# with the same fallback node/path.zsh uses.
if command -v mise &>/dev/null; then
  export PATH="${MISE_DATA_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/mise}/shims:$PATH"
fi
