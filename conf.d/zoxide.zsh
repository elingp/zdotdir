#
# zoxide: Configure zoxide.
#

if ! (( $+commands[zoxide] )); then
  return 0
fi

# https://github.com/ajeetdsouza/zoxide
source <(zoxide init zsh)
