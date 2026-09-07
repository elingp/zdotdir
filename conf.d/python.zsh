#
# Python aliases and functions
#

alias py3='python3'
alias py='python'
alias pip3update="pip3 list --outdated | cut -d ' ' -f1 | xargs -n1 pip3 install -U"
alias pipup="pip list --outdated | cut -d ' ' -f1 | xargs -n1 pip install -U"
alias pyfind='find . -name "*.py"'
alias pygrep='grep --include="*.py"'
alias pyva="source .venv/bin/activate"

# uv
if (( $+commands[uv] )); then
  alias uv="noglob uv"

  alias uva='uv add'
  alias uvexp='uv export --format requirements-txt --no-hashes --output-file requirements.txt --quiet'
  alias uvi='uv init'
  alias uvinw='uv init --no-workspace'
  alias uvl='uv lock'
  alias uvlr='uv lock --refresh'
  alias uvlu='uv lock --upgrade'
  alias uvp='uv pip'
  alias uvpi='uv python install'
  alias uvpl='uv python list'
  alias uvpy='uv python'
  alias uvpp='uv python pin'
  alias uvpu='uv python uninstall'
  alias uvr='uv run'
  alias uvrm='uv remove'
  alias uvs='uv sync'
  alias uvsr='uv sync --refresh'
  alias uvsu='uv sync --upgrade'
  alias uvtr='uv tree'
  alias uvup='uv self update'
  alias uvv='uv venv'
fi

function pyclean {
  # Clean common python cache files.
  find "${@:-.}" -type f -name "*.py[co]" -delete
  find "${@:-.}" -type d -name "__pycache__" -delete
  find "${@:-.}" -depth -type d -name ".mypy_cache" -exec rm -r "{}" +
  find "${@:-.}" -depth -type d -name ".pytest_cache" -exec rm -r "{}" +
}
