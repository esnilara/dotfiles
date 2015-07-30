"============================================================================
" GLOBAL SETTINGS
"============================================================================
set nocompatible               " Use Vim settings, rather then Vi settings
set nobackup                   " No backup file
set t_Co=256
set noswapfile                 " No backup file
set history=1000               " remember more commands and search history
set undolevels=1000            " use many muchos levels of undo
set title                      " change the terminal's title
set visualbell                 " don't beep
set noerrorbells               " don't beep
set nowrap                     " don't wrap lines
set tabstop=2                  " a tab is two spaces
set expandtab
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent                 " always set autoindenting on
set copyindent                 " copy the previous indentation on autoindenting
set number                     " always show line numbers
set shiftwidth=2               " number of spaces to use for autoindenting
set shiftround                 " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                  " set show matching parenthesis
set ignorecase                 " ignore case when searching
set smartcase                  " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                   " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch                   " highlight search terms
set incsearch                  " show search matches as you type
set pastetoggle=<F2>           " Avoid cascading indents when pasting large amounts of text
set laststatus=2               " Always display the status line.
set statusline=%F%m%r%h%w     " Status line display
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ [line/col\ %l,%v]
set colorcolumn=80             " Highlight columns > 80
set cursorline                 " Highlight the current line
filetype off                   " required

"============================================================================
" VUNDLE PLUGINS
"============================================================================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

"========= Basic Tools "======================================
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'mattn/emmet-vim'
"========= Git ===============================================
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
"======== Visual Enhancements ================================
Plugin 'flazz/vim-colorschemes'
Plugin 'ap/vim-css-color'
Plugin 'nathanaelkane/vim-indent-guides'
"======== Javascript Plugins ================================
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Raimondi/delimitMate'
"======= Syntax Highlighters ================================
Plugin 'jelera/vim-javascript-syntax'
Plugin 'cakebaker/scss-syntax.vim'
"======= Linters ============================================
Plugin 'scrooloose/syntastic'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'"
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'"
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'"
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}""
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"============================================================================
" THEME SETTINGS
"============================================================================

"Active theme
if &t_Co >= 256 || has("gui_running")
  colorscheme Tomorrow-Night-Eighties
  "colorscheme railscasts
endif

"============================================================================
" PLUGINS
"============================================================================

"======== CTRL-P SETTINGS ===================================================

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|tmp\|dist'

"======== TRAILING WHITE SPACE ==============================================

"Remove Trailing White Space automatically on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

"autocmd FileType c,cpp,java,php,ruby,python autocmd
"BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"======== NERDTree =========================================================

"NERDTree set on startup
let g:nerdtree_tabs_open_on_console_startup=1

"NERDTree ignore files
set wildignore+=/tmp/,*/tmp/*,*.so,*.swp,*.zip

"======== SYNTASTIC  ========================================================i

if has("autocmd")
  au  BufNewFile,BufRead *.mustache,*.hogan,*.hulk,*.hjs set filetype=html.mustache syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
  au  BufNewFile,BufRead *.handlebars,*.hbs set filetype=html.handlebars syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
endif

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

