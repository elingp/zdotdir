#
# zoxide: Configure zoxide.
#

if ! (( $+commands[zoxide] )); then
  echo "zoxide not found" >&2
  return 1
fi

eval "$(zoxide init zsh)"
