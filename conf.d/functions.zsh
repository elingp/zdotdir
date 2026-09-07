#
# common-functions - Zsh functions
#

##? Backup files or directories
bak() {
  local now f
  now=$(date +"%Y%m%d-%H%M%S")
  for f in "$@"; do
    if [[ ! -e "$f" ]]; then
      echo "file not found: $f" >&2
      continue
    fi
    cp -R "$f" "$f".$now.bak
  done
}

##? optdiff - show a diff between set options and Zsh defaults
optdiff() {
  diff <(zsh -df -c 'set -o') <(set -o)
}

##? Makes any dirs recursively and then touches a file if it doesn't exist
touchf() {
  if [[ -n "$1" ]] && [[ ! -f "$1" ]]; then
    mkdir -p "$1:h" && touch "$1"
  fi
}

##? URL encode a string (supports argument or stdin pipe)
urlencode() {
  python3 -c 'import sys, urllib.parse as u; print(u.quote_plus(sys.stdin.read().strip() if len(sys.argv) < 2 else sys.argv[1]))' "$@"
}

##? URL decode a string (supports argument or stdin pipe)
urldecode() {
  python3 -c 'import sys, urllib.parse as u; print(u.unquote_plus(sys.stdin.read().strip() if len(sys.argv) < 2 else sys.argv[1]))' "$@"
}

##? What's the weather?
weather() {
  curl "http://wttr.in/$1"
}

##? Pass thru for copy/paste markdown
function $ { $@ }
