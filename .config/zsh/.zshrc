#  ____ ____ ____ ____ ____ ____ ____ ____
# ||e |||s |||n |||i |||l |||a |||r |||a ||
# ||__|||__|||__|||__|||__|||__|||__|||__||
# |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
#
# .zshrc
#

echo -e "\033[1mGreetings esnilara (=^ ◡ ^=)\033[0m"

# ======================================================================
#  oh-my-zsh
# ======================================================================
export DEFAULT_USER=esteban.lara

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme to load
ZSH_THEME="agnoster"

# fzf with the_silver_searcher
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind mq` to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  asdf
  compleat
  globalias
  fzf
  npm
  macos
  tig
  tmux
  yarn
  z
)

source $ZSH/oh-my-zsh.sh

# zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

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
  pnpm test -- ${1} --coverage=false
}

# Jest
alias jestclearcache="npx jest --clearCache"

# Folder shortcuts
alias workspace="cd ~/workspace"
alias ws="cd ~/workspace"

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
  kill -9 ${1}
}

# Fleetio

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
alias porter-stage="porter config set--cluster 2587"
alias kibana="~/opt/kibana/bin/kibana"

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

# task to add feature flags to our codebase:
# bin/rails g fleetio:feature_flag ff_my_feature_flag
eval "$(mise activate zsh)"

# Load Elastic Stack environment
[ -f "$HOME/.elastic-env" ] && . "$HOME/.elastic-env"

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi
