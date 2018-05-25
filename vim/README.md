# VIM Installation

## Configuration

### Step 1

- `git clone https://github.com/esnilara/dotfiles`
- `cp dotfiles/vim/.vimrc ~/`
- `cp -r dotfiles/vim/colors/ ~/.vim/`

### Step 2

[Install fzf](https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew)

Use correct rtp folder for fzf (depending if installed with git or Homebrew)

`vim ~/.vimrc`

[Line 229-230](https://github.com/esnilara/dotfiles/blob/master/vim/.vimrc#L229-L230)

### Step 3

Install [Ag silver-searcher](https://github.com/ggreer/the_silver_searcher)

### Step 4

Install [Vundle - Quick Start steps 1 and 2](https://github.com/VundleVim/Vundle.vim)

### Step 5

Install [YouCompleteMe](https://github.com/Valloric/YouCompleteMe#installation)

### Step 6

Install Vundle Plugins

`vim ~/.vimrc`
Type `:PluginInstall`

### Step 7

Make sure to clean .vimrc file if not using fish shell or removing any plugin.
Change theme within the .vimrc and install themes inside `~/.vim/colors/` from
[](https://github.com/flazz/vim-colorschemes/tree/master/colors)
