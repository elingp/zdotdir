#
# gpg: Customize GNUPG
#

# Use an XDG-based GNUPGHOME.
export GNUPGHOME=${GNUPGHOME:-${XDG_DATA_HOME:-$HOME/.local/share}/gnupg}

[[ -d "$GNUPGHOME" ]] || mkdir -p -- "$GNUPGHOME"
chmod 700 -- "$GNUPGHOME" 2>/dev/null || true
