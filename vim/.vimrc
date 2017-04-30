" #### GENERAL SETTINGS  ======================
set nocompatible               " Use Vim settings, rather then Vi settings
set nobackup                   " No backup file
set noswapfile                 " No backup file
set history=1000               " Remember more commands and search history
set undolevels=1000            " Use many muchos levels of undo
"set visualbell                 " Don't beep
set noerrorbells               " Don't beep
set title                      " Change the terminal's title
set scrolloff=3                " Start scrolling 3 lines before the border

" Search
set showmatch                  " Set show matching parenthesis
set ignorecase                 " Ignore case when searching
set smartcase                  " Ignore case if search pattern is all lowercase, case-sensitive otherwise
set incsearch                  " Show search matches as you type

" Tabs and indentation
set nowrap                     " Don't wrap lines
set tabstop=2                  " A tab is two spaces
set expandtab
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set autoindent                 " Always set autoindenting on
set copyindent                 " Copy the previous indentation on autoindenting
set shiftwidth=2               " Number of spaces to use for autoindenting
set shiftround                 " Use multiple of shiftwidth when indenting with '<' and '>'
set smarttab                   " Insert tabs on the start of a line according to shiftwidth, not tabstop

" Global copy to clipboard
set clipboard=unnamedplus

" Fish shell configuration
set shell=/bin/sh

" Remove Trailing White Space automatically on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" Toggle relative number lines
function! NumberToggle()
  if (&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" The Silver Searcher Configuration
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore-dir=DS_Store --ignore-dir=git --ignore-dir=node_modules --ignore-dir=bower_components --ignore-dir=tmp --ignore-dir=dist'
  let g:ctrlp_use_caching = 0
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" Teach a Vim to fish...
if &shell =~# 'fish$'
  set shell=sh
endif

" #### UI TWEAKS ======================
set number                     " Always show line numbers
set laststatus=2               " Always display the status line.
set colorcolumn=90             " Highlight columns > 90
set cursorline                 " Highlight the current line
set hlsearch                   " Highlight search terms
set statusline=%F%m%r%h%w      " Status line display
set statusline+=\ [line/col\ %l,%v]
set enc=utf-8

" Set 256 color support
"set t_Co=256
"set term=screen-256color
"let $TERM='screen-256color'
"let &t_AB="\e[48;5;%dm"
"let &t_AF="\e[38;5;%dm"

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (has("nvim"))
  " For Neovim 0.1.3 and 0.1.4
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799
if (has("termguicolors"))
  set termguicolors
endif

" Set Theme
" colorscheme onedark
 colorscheme base16-railscasts
" colorscheme atom-dark

set background=dark
syntax enable

" Set Vim-Airline Theme
let g:airline_theme="onedark"

" #### KEYBOARD TWEAKS  ======================
let mapleader=","

" Paste toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>           " Avoid cascading indents when pasting large amounts of text
set showmode

" Windows split configuration
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

" Disable arrow keys
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

" #### VUNDLE PLUGINS  ======================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Vim Superpowers
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'

" Syntax support
Plugin  'sheerun/vim-polyglot'

" Images
Plugin 'ashisha/image.vim'

" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Visual Enhancements
Plugin 'flazz/vim-colorschemes'
Plugin 'ap/vim-css-color'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'w0ng/vim-hybrid'

" Ruby
Plugin 'ngmy/vim-rubocop'

" Ruby on Rails
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'janko-m/vim-test'

" Phoenix
Plugin 'c-brenn/phoenix.vim'
Plugin 'tpope/vim-projectionist'
Plugin 'slashmili/alchemist.vim'

" Syntastic Linting
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" #### PLUGIN SETTINGS  ======================

" ## NERDTree
let g:nerdtree_tabs_open_on_console_startup=1             " Set on startup
set wildignore+=/tmp/,*/tmp/*,*.so,*.swp,*.zip            " Ignore files

" ## Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['eslint']

" autocmd FileType c, cpp, java, php, ruby, python autocmd
" BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
autocmd BufNewFile,BufReadPost *.md, *.markdown set filetype=markdown
autocmd BufNewFile,BufRead *.mustache,*.hogan,*.hulk,*.hjs set filetype=html.mustache syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
autocmd BufNewFile,BufRead *.handlebars,*.hbs set filetype=html.handlebars syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim

" Disable HTML Tidy
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

" ## GutenTags Cache Dir
let g:gutentags_cache_dir = '~/.tags_cache'

" ## Alchemist Configuration
let g:alchemist_tag_disable = 1

" ## Emmet
let g:user_emmet_leader_key = '<c-z>'         " To use Emmet, always remember to press , after key map
