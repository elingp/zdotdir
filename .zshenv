#!/usr/bin/env zsh
#
# .zshenv: Zsh environment file, loaded always.
#

export ZDOTDIR="${ZDOTDIR:-$HOME/.config/zsh}"

# Prefer Homebrew Zsh for interactive terminal sessions if available
if [[ -o interactive && -t 0 && -z "$ZSH_EXECUTION_STRING" ]]; then
  () {
    local brew_zsh="${HOMEBREW_PREFIX:-/home/linuxbrew/.linuxbrew}/bin/zsh"
    [[ -x $brew_zsh ]] || brew_zsh="/opt/homebrew/bin/zsh"

    if [[ -x $brew_zsh && "$(readlink /proc/$$/exe 2>/dev/null)" != "$(readlink -f "$brew_zsh" 2>/dev/null)" ]]; then
      export SHELL="$brew_zsh"
      (( SHLVL-- ))
      [[ -o login ]] && exec "$brew_zsh" -l "$@" || exec "$brew_zsh" "$@"
    fi
  }
fi

# XDG
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

if [[ ! -o LOGIN ]] && [[ -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
