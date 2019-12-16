"  ____ ____ ____ ____ ____ ____ ____ ____
" ||e |||s |||n |||i |||l |||a |||r |||a ||
" ||__|||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
"
" esnilara's .vimrc file
"
"
" ======================================================================
" GENERAL SETTINGS
" ======================================================================
"
set nocompatible               " Use Vim settings, rather then Vi settings
set nobackup                   " No backup file
set noswapfile                 " No backup file
set pastetoggle=<F2>           " Avoid cascading indents when pasting large amounts of text
set showmode

" Windows split configuration
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999
set switchbuf+=usetab,newtab " Open quickfix view files in new tab

" Undo
call system("mkdir -p $HOME/.vim/undo")
set hidden
set history=1000               " Remember more commands and search history
set undodir=$HOME/.vim/undo/
set undofile
set undolevels=1000            " Use many muchos levels of undo
set undoreload=10000

"set visualbell                " Don't beep
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
if has('macunix')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

" Remove Trailing White Space automatically on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" Relative number lines
function! NumberToggle()
  if(&nu == 1)
    set nu!
    set rnu
  else
    set nornu
    set nu
  endif
endfunc

" Mouse click navigation
set mouse=a

" The Silver Searcher Configuration
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" ======================================================================
" KEY MAPS
" ======================================================================

" Map Leader
let mapleader=","

" Emmet
let g:user_emmet_leader_key = '<c-z>' " To use Emmet, always remember to press , after key map

" Toggle relative number lines
nnoremap <C-n> :call NumberToggle()<CR>

" Paste toggle
nnoremap <F2> :set invpaste paste?<CR>

" NERDTree commands
nmap <leader>ne :NERDTree<CR>
nmap <leader>nf :NERDTreeFind<CR>

" Ag Search for word
nmap <M-k>:Ag "<cword>"<CR>
nmap <Esc>k :Ag "<cword>"<CR>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" fzf
nmap ; :Buffers<CR>
nmap <C-p> :Files<CR>
nmap <Leader>r :Tags<CR>

" Disable arrow keys
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" ======================================================================
" UI TWEAKS
" ======================================================================
set number                     " Always show line numbers
set laststatus=2               " Always display the status line.
set colorcolumn=90             " Highlight columns > 90
set cursorline                 " Highlight the current line
set hlsearch                   " Highlight search terms
set statusline=%F%m%r%h%w      " Status line display
set statusline+=\ [line/col\ %l,%v]
set enc=utf-8

" Set 256 color support
" set t_Co=256
" set term=screen-256color
" let $TERM='screen-256color'
" let &t_AB="\e[48;5;%dm"
" let &t_AF="\e[38;5;%dm"
"
" tmux bg_color correction hack
set t_ut=

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799
if (has("termguicolors"))
  set termguicolors
endif

" Set Theme
" colorscheme onedark
" colorscheme atom-dark
colorscheme base16-railscasts
set background=dark
syntax enable

" Set Vim-Airline Theme
let g:airline_theme="molokai"

" ======================================================================
" VUNDLE PLUGINS
" ======================================================================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Vim Superpowers
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'
Plugin 'Valloric/YouCompleteMe'

" Tmux
Plugin 'christoomey/vim-tmux-navigator'

" Syntax support
Plugin  'sheerun/vim-polyglot'

" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Visual Enhancements
Plugin 'nathanaelkane/vim-indent-guides'

" Ruby
Plugin 'ngmy/vim-rubocop'

" Elixir
Plugin 'mhinz/vim-mix-format'

" Linting
Plugin 'w0rp/ale'

" CSS
Plugin 'ap/vim-css-color'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ======================================================================
" PLUGIN CONFIGURATION
" ======================================================================

" NERDTree
let g:nerdtree_tabs_open_on_console_startup=0        " Set on startup
set wildignore+=/tmp/,*/tmp/*,*.so,*.swp,*.zip       " Ignore files

" FZF
set rtp+=/usr/local/opt/fzf "osx
" set rtp+=~/.fzf "linux

" Autocmd
augroup vimrc_autocmd
  autocmd!
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
  autocmd BufNewFile,BufRead *.mustache,*.hogan,*.hulk,*.hjs set filetype=html.mustache syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
  autocmd BufNewFile,BufRead *.handlebars,*.hbs set filetype=html.handlebars syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
augroup END

" GutenTags Cache Dir
let g:gutentags_cache_dir = '~/.tags_cache'

" IndentLine
let g:indentLine_char = '┊'
