#
# Antidote
#

_antidote_root="${HOMEBREW_PREFIX:-/home/linuxbrew/.linuxbrew}/opt/antidote/share/antidote"

if [[ -r "$_antidote_root/functions/antidote" ]]; then
  fpath=("$_antidote_root/functions" $fpath)
  autoload -Uz antidote
elif [[ -r "$_antidote_root/antidote.zsh" ]]; then
  source "$_antidote_root/antidote.zsh"
else
  print -u2 -- "antidote: not found at $_antidote_root"
  unset _antidote_root
  return 0
fi

# Antidote tuning
zstyle ':antidote:bundle' use-friendly-names 'yes'
zstyle ':antidote:plugin:*' defer-options '-p'
zstyle ':antidote:*' zcompile 'yes'

# Generate a static plugin load file only when the source .txt changes.
_zsh_plugins_txt="${ZDOTDIR:-$HOME}/.zsh_plugins.txt"
_zsh_plugins_zsh="${ZDOTDIR:-$HOME}/.zsh_plugins.zsh"

[[ -f "$_zsh_plugins_txt" ]] || touch "$_zsh_plugins_txt"

if [[ ! -r "$_zsh_plugins_zsh" || ! "$_zsh_plugins_zsh" -nt "$_zsh_plugins_txt" ]]; then
  antidote bundle <"$_zsh_plugins_txt" >| "$_zsh_plugins_zsh"
fi

source "$_zsh_plugins_zsh"

unset _antidote_root _zsh_plugins_txt _zsh_plugins_zsh
