# Terminal

case "${TERM_PROGRAM:l}" in
  vscode)
    # https://code.visualstudio.com/docs/terminal/shell-integration
    _histfile=${HISTFILE:-${XDG_DATA_HOME:-$HOME/.local/share}/zsh/zsh_history}
    _vscode_integration_cache="$ZSH_CACHE_DIR/vscode-shell-integration-path"

    [[ -r "$_vscode_integration_cache" ]] && _vscode_integration_path="$(<"$_vscode_integration_cache")"

    if [[ ! -r "$_vscode_integration_path" && $+commands[code] -eq 1 ]]; then
      _vscode_integration_path="$(code --locate-shell-integration-path zsh 2>/dev/null)"
      [[ -n "$_vscode_integration_path" ]] && print -r -- "$_vscode_integration_path" >| "$_vscode_integration_cache"
    fi

    [[ -r "$_vscode_integration_path" ]] && source "$_vscode_integration_path"
    HISTFILE=$_histfile
    unset _histfile _vscode_integration_cache _vscode_integration_path
    ;;
esac
