# SQLite history
# cached-eval histdb init zsh
# syntax highlighting
cached-eval zsh-patina activate
# cd replacement
cached-eval zoxide init zsh
# x-shell completions
export CARAPACE_BRIDGES="${CARAPACE_BRIDGES:-fish,bash}"
cached-eval carapace _carapace
