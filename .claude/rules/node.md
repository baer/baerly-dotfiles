---
globs: ["node/*"]
---

- Mise is the version manager, activated in `node/mise_and_npm.zsh` by prepending mise's shim dir to PATH (not full `mise activate zsh`). Shims resolve the per-directory tool version at exec time, so they work for non-interactive callers (scripts, IDEs, gdev checks) as well as interactive shells — full activation only re-prepends on the zsh chpwd hook, which non-interactive callers never trigger. `node/mise_and_npm.zsh` loads after every `path.zsh`, so its prepend keeps mise ahead of Homebrew and system binaries even though `~/.gusto/init.sh` already ran `mise activate --shims` earlier in the work-machine init order.
- `npm config set save-exact true` is set globally in this file. All npm installs pin exact versions.
- New node-related paths go in `node/path.zsh`, not `system/_path.zsh`.
