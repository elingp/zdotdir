#
# Antidote
#

##### ANTIDOTE #####
source "$HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh"

# Antidote tuning (optional)
zstyle ':antidote:bundle' use-friendly-names 'yes'
zstyle ':antidote:plugin:*' defer-options '-p'
zstyle ':antidote:bundle:*' zcompile 'yes'

# Generate a static plugin load file only when the source .txt changes.
_zsh_plugins_txt="${ZDOTDIR:-$HOME}/.zsh_plugins.txt"
_zsh_plugins_zsh="${ZDOTDIR:-$HOME}/.zsh_plugins.zsh"

if [[ ! -r "$_zsh_plugins_zsh" || ! "$_zsh_plugins_zsh" -nt "$_zsh_plugins_txt" ]]; then
	antidote bundle <"$_zsh_plugins_txt" >| "$_zsh_plugins_zsh"
fi

source "$_zsh_plugins_zsh"

unset _zsh_plugins_txt _zsh_plugins_zsh
