#  ____ ____ ____ ____ ____ ____ ____ ____
# ||e |||s |||n |||i |||l |||a |||r |||a ||
# ||__|||__|||__|||__|||__|||__|||__|||__||
# |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
#
# .zshrc

echo -e "\033[1mGreetings ${USER} (=^ ◡ ^=)\033[0m"

export DEFAULT_USER="$USER"
export ZSH="$HOME/.oh-my-zsh"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'

ZSH_THEME="agnoster"

plugins=(git globalias z)

command -v mise >/dev/null 2>&1 && plugins+=(mise)
command -v fzf >/dev/null 2>&1 && plugins+=(fzf)
command -v npm >/dev/null 2>&1 && plugins+=(npm)
command -v tig >/dev/null 2>&1 && plugins+=(tig)
command -v tmux >/dev/null 2>&1 && plugins+=(tmux)
command -v yarn >/dev/null 2>&1 && plugins+=(yarn)
[[ "$OSTYPE" == darwin* ]] && plugins+=(macos)

source "$ZSH/oh-my-zsh.sh"

# zsh-syntax-highlighting
if command -v brew >/dev/null 2>&1; then
  local zsh_syntax_file="$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
 [ -f "$zsh_syntax_file" ] && source "$zsh_syntax_file"
fi

if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# Load Elastic Stack environment
[ -f "$HOME/.elastic-env" ] && . "$HOME/.elastic-env"

if command -v wt >/dev/null 2>&1; then 
  eval "$(command wt config shell init zsh)"
fi

# ======================================================================
#  Personal aliases
# ======================================================================

# general
alias q="exit"
alias cl="clear"
alias sudo="sudo"
alias fzfp="fzf --preview 'bat --color=always {}'"

# npm
alias npmci="rm -rf node_modules tmp dist && npm install"

# pnpm
alias pn="pnpm"
alias pnci="rm -rf node_modules && pnpm install"
alias pnd="pnpm dev"
alias pnb="pnpm build"
alias pns="pnpm storybook"
alias pnt="pnpm test"
alias pno="pnpm outdated"

function ptest() {
  pnpm test -- "${1}" --coverage=false
}

# Jest
alias jestclearcache="npx jest --clearCache"

# Folder shortcuts
alias workspace='cd "$HOME/workspace"'
alias ws='cd "$HOME/workspace"'

# Git
cherry_pick_range() {
  local dry_run=0

  # Check for -n or --dry-run flag
  if [[ $1 == "-n" || $1 == "--dry-run" ]]; then
    dry_run=1
    shift
  fi

  # Ensure we have exactly two arguments
  if [[ $# -ne 2 ]]; then
    echo "Usage: gcp [-n|--dry-run] <first_commit> <last_commit>"
    return 1
  fi

  local first_commit=$1
  local last_commit=$2

  if [[ $dry_run -eq 1 ]]; then
    echo "Performing dry run cherry-pick: $first_commit^..$last_commit"
    git cherry-pick --dry-run "${first_commit}^..${last_commit}"
  else
    git cherry-pick "${first_commit}^..${last_commit}"
  fi
}

alias cm="git commit"
alias cmam="git commit --amend"
alias cmm="git commit -m"
alias cmma="git commit -am"
alias ga="git add -A"
alias gap="git add -p"
alias gb="git branch"
alias gbr="git branch -r"
alias gcp="cherry_pick_range"
alias gf="git fetch"
alias gfo="git fetch origin"
alias gfp="git fetch --prune"
alias gl="git log --graph --oneline --decorate"
alias glch="git rev-parse --verify HEAD"
alias go="git checkout"
alias gr="git rebase"
alias gri="git rebase -i HEAD~"
alias gs="git status"
alias psh="git push origin"
alias pll="git pull origin"
alias lg="lazygit"

function psh-fwl() {
  git push --force-with-lease origin "${1:-HEAD}"
}

# Overmind
alias ovs="overmind start"
alias ovk="overmind kill"
alias ovc="overmind connect"

# Port management
function whichport() {
  sudo lsof -i ":${1}"
}

# Process management
function killprocess() {
  kill -9 "${1}"
}

# ======================================================================
# Fleetio
# ======================================================================

alias upd="bin/update"
alias migrate-status-leader="bundle exec rake db:migrate:status:leader"
alias reset-test-db="bundle exec rails db:reset RAILS_ENV=test"
alias i18n="./bin/i18n-var-replace-and-translate"

alias rspec="bundle exec rspec"
alias rspecdoc="bundle exec rspec --format documentation"
alias rubocop="bundle exec rubocop --parallel"

alias rails="bundle exec rails"
alias sandbox="bundle exec rails c --sandbox"
alias rcons="bundle exec rails c"

alias storybook="pnpm run storybook"

alias porter-list="porter cluster list"
alias porter-prod="porter config set-cluster 2652"
alias porter-stage="porter config set-cluster 2587"
alias kibana="$HOME/opt/kibana/bin/kibana"

alias lint-all='
  pnpm run lint &&
  pnpm run tsc:check &&
  bin/brakeman --ignore-config ./config/brakeman.ignore --exit-on-warn . &&
  bin/reek &&
  bin/lint_i18n_variables &&
  bin/lint_engine_imports &&
  bin/packwerk check &&
  bin/lint-foreign-keys &&
  bin/lint-foreign-key-indexes &&
  bin/lint-jobs-are-sidekiq-workers &&
  bin/lint-api-error-responses &&
  bin/lint-jobs &&
  bin/lint-package-yml &&
  bin/lint-codeowners &&
  bin/lint-package-stewards &&
  echo "✅ All linters passed successfully!"
'

fleetio_rollback_added_migrations() {
  # Change this if your base branch is not master
  local base_branch="master"

  # Get the list of added migration files (most recent first)
  local added_migrations=($(git diff --name-status $base_branch...HEAD | grep 'A\s*db/migrate/' | awk '{print $2}' | sort -r))

  for file in "${added_migrations[@]}"; do
    local timestamp=$(echo $file | grep -oE '[0-9]{14}')
    if [[ -n "$timestamp" ]]; then
      echo "Rolling back migration: $file"
      bundle exec rake db:migrate:down:leader VERSION=$timestamp
    fi
  done
}

# Local overrides (machine-specific, not tracked)
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
