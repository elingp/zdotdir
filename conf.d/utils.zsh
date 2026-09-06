cached-eval bun completions
# cached-eval histdb init zsh # not installed (need mattmc3's histdb)
cached-eval mise activate zsh # `cached-eval --clear mise activate zsh` if `code` problem arises
# cached-eval uv generate-shell-completion zsh # hooked by Brew
# cached-eval zsh-patina activate # hooked by Z1
cached-eval zoxide init zsh

export CARAPACE_BRIDGES="${CARAPACE_BRIDGES:-fish,bash}"
cached-eval carapace _carapace
