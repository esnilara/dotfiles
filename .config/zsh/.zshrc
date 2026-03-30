#  ____ ____ ____ ____ ____ ____ ____ ____
# ||e |||s |||n |||i |||l |||a |||r |||a ||
# ||__|||__|||__|||__|||__|||__|||__|||__||
# |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
#
# .zshrc
#

echo -e "\033[1mGreetings esnilara (=^ ◡ ^=)\033[0m"

# ======================================================================
# LunarVim  
# ======================================================================
export PATH=$HOME/.local/bin:$PATH
alias vim=lvim
alias nvim=lvim
export EDITOR="lvim"
export VISUAL="lvim"

# ======================================================================
#  Homebrew Paths  
# ======================================================================

# Python
export PATH=/opt/homebrew/opt/python/libexec/bin:$PATH

# ======================================================================
#  Tokens  
# ======================================================================

# NPM Token
export NPM_TOKEN=
export DEFAULT_USER=

# Github Token
export BUNDLE_GITHUB__COM=
export GITHUB_ACCESS_TOKEN=

# ======================================================================
#  oh-my-zsh  
# ======================================================================

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
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

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
alias pnci="rm -rf node_modules tmp dist .output .nuxt && pnpm install"
alias pnd="pnpm dev"
alias pnb="pnpm build"
alias pns="pnpm storybook"
alias pnt="pnpm test"
alias pno="pnpm outdated"

function ptest() {
  pnpm test -- ${1} --coverage=false
}

export PNPM_HOME="/Users/esnilara/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Jest
alias jestclearcache="npx jest --clearCache"

# Folder shortcuts
alias workspace="cd ~/workspace"
alias ws="cd ~/workspace"

# Git
alias lg="lazygit"
alias gf="git fetch"
alias gfo="git fetch origin"
alias gfp="git fetch --prune"
alias gs="git status"
alias ga="git add -A"
alias gap="git add -p"
alias go="git checkout"
alias gb="git branch"
alias gbr="git branch -r"
alias gr="git rebase"
alias gri="git rebase -i HEAD~"
alias gl="git log --graph --oneline --decorate"
alias glch="git rev-parse --verify HEAD"
alias psh="git push origin"
alias pll="git pull origin"
alias cm="git commit"
alias cmam="git commit --amend"
alias cmm="git commit -m"
alias cmma="git commit -am"

# Apptegy
alias clog="~/workspace/apptegy/clog/./clog"
alias uno="/Users/esnilara/.asdf/installs/ruby/3.1.2/bin/neptuno"

# Port management
function whichport() {
  sudo lsof -i ":${1}"
}

# Process management 
function killprocess() {
  kill -9 ${1}
}

