#
# fzf: Configure the fuzzy finder.
#

if ! (( $+commands[fzf] )); then
  echo "fzf not found" >&2
  return 1
fi

source <(fzf --zsh)
