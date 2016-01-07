### Export Paths
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
export NVM_DIR=~/.nvm

# Use VIM as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

### Aliases

# Task Warrior
alias t="task"

# Alias to start postgres. postgres -D /usr/local/pgsql/data
alias postgres="postgres -D /usr/local/pgsql/data >logfile 2>&1 &"

# Color LS
#colorflag="-G"
#alias ls="command ls ${colorflag}"
#alias l="ls -lF ${colorflag}" # all files, in long format
#alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
#alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias :q="exit"

# Development Shortcuts
alias es="ember server"
alias fs="foreman start"

# Shortcut to my workspace folder in my home directory
alias workspace="cd ~/workspace"
alias ws="cd ~/workspace"

# Enable aliases to be sudo’ed
alias sudo="sudo "

# Git
# You must install Git first - ""
alias gf="git fetch"
alias gs="git status"
alias ga="git add -A"
alias gap="git add -p"
alias go="git checkout"
alias gb="git branch"
alias gr="git rebase"
alias gl="git log --graph --oneline --decorate"
alias psh="git push origin" #push to origin specifying branch, ex. psh master
alias pll="git pull origin" #pull from origin specifying branch, ex. pll master
alias cmm="git commit -m" #commit
alias cmma="git commit -am" #commit and add modified files

# Edit Bash Profle
alias editbash="vim ~/.bash_profile"
alias bashedit="vim ~/.bash_profile"

# Remote SSH Session
function sshwork() {
  ssh -t esnilara@$1 "screen -dR"
}

function sshworktunnel() {
  ssh -D 8080 -Nf esnilara@$1
}

# Remote NGROK connection
function ngrok() {
	ssh -p 57091 -t esnilara@0.tcp.ngrok.io "screen -dR"
}

# Create Remote NGROK connection with tunnel
function ngroktunnel() {
	ssh -p 57091 -D 8080 -Nf esnilara@0.tcp.ngrok.io
}

# List processes running in port
function checkforport() {
  lsof -ti:$1
}

# Kill processes running in port
function killtheport() {
  lsof -ti:$1 | xargs kill -9
}

### Prompt Colors
# Modified version of @gf3’s Sexy Bash Prompt
# (https://github.com/gf3/dotfiles)

export TERM=gnome-256color

if tput setaf 1 &> /dev/null; then
	tput sgr0
fi

export BLACK
export MAGENTA
export ORANGE
export GREEN
export PURPLE
export WHITE
export BOLD
export RESET

# Git branch details
function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Change this symbol to something sweet.
# (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol="⚡ "

export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n$symbol\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"

### Misc

# Only show the current directory's name in the tab
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# init z! (https://github.com/rupa/z). z.sh file should be installed in root folder.
. ~/z.sh

export NVM_DIR="/Users/esnilara/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
