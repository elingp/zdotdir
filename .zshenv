#!/usr/bin/env zsh
#
# .zshenv: Zsh environment file, loaded always.
#

export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

# Prefer Homebrew Zsh for interactive terminal sessions if available
if [[ -o interactive && -t 0 && -z "$ZSH_EXECUTION_STRING" && -z "$ZSH_SCRIPT" ]]; then
  typeset _brew_zsh="${HOMEBREW_PREFIX:-/home/linuxbrew/.linuxbrew}/bin/zsh"
  [[ -x "$_brew_zsh" ]] || _brew_zsh="/opt/homebrew/bin/zsh"
  if [[ -x "$_brew_zsh" ]]; then
    typeset _real_current="$(readlink /proc/$$/exe 2>/dev/null)"
    typeset _real_brew="$(readlink -f "$_brew_zsh" 2>/dev/null)"
    if [[ -n "$_real_brew" && -n "$_real_current" && "$_real_current" != "$_real_brew" ]]; then
      export SHELL="$_brew_zsh"
      (( SHLVL > 0 )) && (( SHLVL-- ))
      if [[ -o login ]]; then
        exec "$_brew_zsh" -l "$@"
      else
        exec "$_brew_zsh" "$@"
      fi
    fi
    unset _real_current _real_brew
  fi
  unset _brew_zsh
fi

# XDG
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

if [[ ! -o LOGIN ]] && [[ -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
