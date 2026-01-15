#
# gpg: Customize GNUPG
#

# Use an XDG-based GNUPGHOME.
# This repo keeps user config under XDG, and GnuPG works fine here as long as
# the directory exists and has safe permissions.
export GNUPGHOME=${GNUPGHOME:-${XDG_DATA_HOME:-$HOME/.local/share}/gnupg}

mkdir -p -- "$GNUPGHOME"
chmod 700 -- "$GNUPGHOME" 2>/dev/null || true
