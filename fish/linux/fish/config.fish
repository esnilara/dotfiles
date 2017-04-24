# use nvm on start
nvm use default --silent

# fix backtick keyboard
xmodmap -e 'keycode 49 = grave asciitilde'

# Make Vim the default editor
set --export EDITOR 'vim -f'

# Make Vim usable with git
set --export GIT_EDITOR 'vim -f'
