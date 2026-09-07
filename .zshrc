#!/usr/bin/env zsh
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

# Profiling
[[ "$ZPROFRC" -ne 1 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# Set the styles
[[ -r $ZDOTDIR/.zstyles ]] \
 && . $ZDOTDIR/.zstyles

# Create an amazing Zsh config using antidote plugins.
fpath+=($ZDOTDIR/functions $fpath)
source $ZDOTDIR/lib/antidote.zsh

# Never start in the root file system.
[[ "$PWD" != "/" ]] || cd

# Source conf.d before local settings
run_confd

# Local settings
[[ -r $HOME/.local/config/zsh/.zshrc.local ]] \
 && . $HOME/.local/config/zsh/.zshrc.local

# Run the end of zshrc hook manually (defined in Z1)
run_post_zshrc

# Finish profiling by calling zprof.
[[ "$ZPROFRC" -eq 1 ]] && zprof
[[ -v ZPROFRC ]] && unset ZPROFRC

# Always return success
true
