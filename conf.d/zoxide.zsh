#
# zoxide: Configure zoxide.
#

if ! (( $+commands[zoxide] )); then
  return 0
fi

# https://github.com/ajeetdsouza/zoxide
_zoxide_cache_dir="${ZSH_CACHE_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/zsh}"
_zoxide_init_cache="$_zoxide_cache_dir/zoxide-init.zsh"

mkdir -p -- "$_zoxide_cache_dir" 2>/dev/null || true

if [[ ! -r "$_zoxide_init_cache" || "$_zoxide_init_cache" -ot "${commands[zoxide]}" ]]; then
  zoxide init zsh >| "$_zoxide_init_cache"
fi

source "$_zoxide_init_cache"

unset _zoxide_cache_dir _zoxide_init_cache
