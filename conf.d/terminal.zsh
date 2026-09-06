# ------------------------------------------------------------------------------
# VS Code in WSL Smart Wrapper
# ------------------------------------------------------------------------------
# In WSL, there are two distinct 'code' commands:
#   1. Windows launcher (/mnt/c/.../Microsoft VS Code/bin/code):
#      Launches/focuses VS Code in Windows and connects to this WSL distro.
#      Works from ANYWHERE (Windows Terminal, tmux, external shells).
#   2. VS Code Server internal CLI (~/.vscode-server/.../remote-cli/code):
#      Talks to an already-open VS Code window. It strictly requires
#      $VSCODE_IPC_HOOK_CLI (a live socket created by the VS Code terminal).
#      If run outside VS Code, it fails with:
#      "Command is only available in WSL or inside a Visual Studio Code terminal."
#
# If ~/.vscode-server ever leaks into $PATH outside VS Code, this wrapper ensures:
#   - Inside VS Code: uses the fast internal remote-cli via its IPC socket.
#   - Outside VS Code (or if the socket died): routes to the Windows launcher
#     so `code .` always opens VS Code without errors.
# ------------------------------------------------------------------------------
# if [[ -n "$WSL_DISTRO_NAME" || -n "$WSL_INTEROP" ]]; then
#   code() {
#     if [[ -z "$VSCODE_IPC_HOOK_CLI" || ! -S "$VSCODE_IPC_HOOK_CLI" ]]; then
#       local c
#       for c in "${(@f)$(which -a code 2>/dev/null)}" \
#                /mnt/c/Users/*/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code(N) \
#                "/mnt/c/Program Files/Microsoft VS Code/bin/code"(N); do
#         if [[ "$c" != *".vscode-server"* && -x "$c" ]]; then
#           "$c" "$@"
#           return $?
#         fi
#       done
#     fi
#     command code "$@"
#   }
# fi

() {
  case "${TERM_PROGRAM:l}" in
    vscode)
      # https://code.visualstudio.com/docs/terminal/shell-integration
      [[ -n "$VSCODE_SHELL_INTEGRATION" ]] && return

      local _histfile="${HISTFILE:-${ZSH_DATA_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/zsh}/zsh_history}"
      local _vscode_integration_cache="$ZSH_CACHE_DIR/vscode-shell-integration-path"
      local _vscode_integration_path

      [[ -r "$_vscode_integration_cache" ]] && _vscode_integration_path="$(<"$_vscode_integration_cache")"

      if [[ ! -r "$_vscode_integration_path" && $+commands[code] -eq 1 ]]; then
        _vscode_integration_path="$(code --locate-shell-integration-path zsh 2>/dev/null)"
        [[ -n "$_vscode_integration_path" ]] && print -r -- "$_vscode_integration_path" >| "$_vscode_integration_cache"
      fi

      if [[ -r "$_vscode_integration_path" ]]; then
        # Prevent shellIntegration-rc.zsh from recursively re-sourcing .zshrc when VSCODE_INJECTION=1
        local _vsc_injection="${VSCODE_INJECTION-}"
        unset VSCODE_INJECTION
        source "$_vscode_integration_path"
        [[ -n "$_vsc_injection" ]] && export VSCODE_INJECTION="$_vsc_injection"
      fi

      HISTFILE="$_histfile"
      ;;
  esac
}
