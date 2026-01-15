#
# prompt: Set up the Zsh prompt system.
#

# Initialize prompt
setopt prompt_subst transient_rprompt

# Prefer oh-my-posh if available.
if (( $+commands[oh-my-posh] )); then
  _omp_theme=${POSH_THEME_NAME:-ys}

  # Avoid spawning `brew` during shell init; prefer HOMEBREW_PREFIX.
  if [[ -z "${POSH_THEMES_PATH:-}" && -n "${HOMEBREW_PREFIX:-}" ]]; then
    POSH_THEMES_PATH="$HOMEBREW_PREFIX/opt/oh-my-posh/share/oh-my-posh/themes"
  fi

  if [[ -n "${POSH_THEMES_PATH:-}" && -r "$POSH_THEMES_PATH/$_omp_theme.omp.json" ]]; then
    eval "$(oh-my-posh init zsh --config "$POSH_THEMES_PATH/$_omp_theme.omp.json")"
  else
    eval "$(oh-my-posh init zsh)"
  fi

  unset _omp_theme
else
  # Minimal fallback prompt if oh-my-posh isn't installed.
  PROMPT='%n@%m:%~%# '
fi
