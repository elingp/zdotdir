#
# __init__: This runs prior to any other conf.d contents.
#

# Apps
export EDITOR=code
export VISUAL=code
export PAGER=less

##### PATH / ENV #####

# Ensure gpg-agent can prompt for passphrases correctly.
export GPG_TTY="$(tty 2>/dev/null)"
