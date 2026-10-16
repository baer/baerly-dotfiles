#!/usr/bin/env bats

setup() {
  load '../test_helper'

  export LOGFILE="$BATS_TEST_TMPDIR/brew-ops.log"
  : > "$LOGFILE"

  substep_start() { :; }
  substep_stop() { :; }

  source "$DOTFILES_ROOT/script/lib/brew-ops.sh"
}

brew() {
  printf '%s\n' "$*"
}

@test "brew_run_upgrade disables confirmation in spinner mode" {
  VERBOSE=false

  brew_run_upgrade

  run cat "$LOGFILE"
  [ "$status" -eq 0 ]
  [ "$output" = "upgrade --yes" ]
}

@test "brew_run_upgrade disables confirmation in verbose mode" {
  VERBOSE=true

  brew_run_upgrade

  run cat "$LOGFILE"
  [ "$status" -eq 0 ]
  [ "$output" = "upgrade --yes" ]
}
