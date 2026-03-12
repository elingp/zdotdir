#
# prompt: Set up the Zsh prompt system.
#

# Initialize prompt
setopt prompt_subst transient_rprompt

# Prefer oh-my-posh if available.
if (( $+commands[oh-my-posh] )); then
  _omp_theme=${POSH_THEME_NAME:-ys}
  _omp_themes_dir=${POSH_THEMES_PATH:-${HOMEBREW_PREFIX:+$HOMEBREW_PREFIX/opt/oh-my-posh/share/oh-my-posh/themes}}
  _omp_config=

  [[ -n "$_omp_themes_dir" ]] && _omp_config="$_omp_themes_dir/$_omp_theme.omp.json"

  if [[ -n "$_omp_config" && -r "$_omp_config" ]]; then
    eval "$(oh-my-posh init zsh --config "$_omp_config")"
  else
    eval "$(oh-my-posh init zsh)"
  fi

  unset _omp_theme _omp_themes_dir _omp_config
else
  # Minimal fallback prompt if oh-my-posh isn't installed.
  PROMPT='%n@%m:%~%# '
fi
