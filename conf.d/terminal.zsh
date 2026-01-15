# Terminal

case "${TERM_PROGRAM:l}" in
  vscode)
    # https://code.visualstudio.com/docs/terminal/shell-integration
    MY_HISTFILE=${HISTFILE-}

    # Avoid spawning `code` on every shell start by caching the integration path.
    if (( $+commands[code] )); then
      _vscode_integration_cache="${ZSH_CACHE_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/zsh}/vscode-shell-integration-path"

      if [[ -r "$_vscode_integration_cache" ]]; then
        _vscode_integration_path="$(<"$_vscode_integration_cache")"
      else
        _vscode_integration_path="$(code --locate-shell-integration-path zsh 2>/dev/null)"
        [[ -n "${_vscode_integration_path:-}" ]] && print -r -- "$_vscode_integration_path" >| "$_vscode_integration_cache"
      fi

      [[ -n "${_vscode_integration_path:-}" && -r "$_vscode_integration_path" ]] && source "$_vscode_integration_path"

      unset _vscode_integration_cache _vscode_integration_path
    fi
    [[ -n ${MY_HISTFILE-} ]] && HISTFILE=$MY_HISTFILE
    unset MY_HISTFILE
    ;;
esac
