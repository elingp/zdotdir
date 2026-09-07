#!/usr/bin/env zsh

typeset -gUa path fpath prepath

# Apps
export EDITOR=code
export VISUAL=code
export PAGER=less
export SHELL_SESSIONS_DISABLE=1

# Ensure gpg-agent can prompt for passphrases correctly.
export GPG_TTY=$TTY

# Setup Homebrew / Linuxbrew if installed
if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the path elements that should always be first
prepath=(
  $HOME/bin(N)
  $HOME/.local/bin(N)
)
path=( $prepath $path )
