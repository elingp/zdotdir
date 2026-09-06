# Locate antidote: prefer Homebrew, fall back to $ZDOTDIR/.antidote
antidote_dir=${HOMEBREW_PREFIX:-/home/linuxbrew/.linuxbrew}/opt/antidote/share/antidote
if [[ ! -d $antidote_dir ]]; then
  antidote_dir=${ZDOTDIR:-$HOME}/.antidote
  [[ -d $antidote_dir ]] || git clone --depth=1 https://github.com/mattmc3/antidote $antidote_dir
fi

# Lazy-load antidote from its functions directory
fpath=($antidote_dir/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Remove incompatible .zwc if Zsh version changed
if [[ -f ${zsh_plugins}.zsh.zwc ]] && ! zcompile -t ${zsh_plugins}.zsh.zwc &>/dev/null; then
  rm -f ${zsh_plugins}.zsh.zwc ${zsh_plugins}.zsh.zwc.old
fi

# Source your static plugins file
source ${zsh_plugins}.zsh

# Clean up
unset antidote_dir zsh_plugins
