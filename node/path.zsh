# pnpm global bin — required for `pnpm add -g <tool>` binaries to be runnable.
# XDG_DATA_HOME is set in system/env.zsh which loads after path files, so we
# repeat its default here.
export PNPM_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/pnpm"
export PATH="$PNPM_HOME/bin:$PATH"

[[ "$(uname -s)" == "Darwin" ]] || return 0

# Export globally installed npm scripts
export PATH="$HOMEBREW_PREFIX/share/npm/bin:$PATH"
