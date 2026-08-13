#!/usr/bin/env zsh

typeset -gUa path fpath prepath

# XDG
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_PROJECTS_DIR=${XDG_PROJECTS_DIR:-$HOME/projects}

# Apps
export EDITOR=code
export VISUAL=code
export PAGER=less
export SHELL_SESSIONS_DISABLE=1

# Ensure gpg-agent can prompt for passphrases correctly.
export GPG_TTY="$(tty 2>/dev/null)"

# Set the path elements that should always be first
prepath=(
  $HOME/bin(N)
  /opt/homebrew/bin(N)
  $HOME/.local/bin(N)
)
path=( $prepath $path )
