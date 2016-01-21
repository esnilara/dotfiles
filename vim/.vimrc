" #######  GLOBAL SETTINGS  #######
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
set statusline=%F%m%r%h%w      " Status line display
set statusline+=\ [line/col\ %l,%v]
set colorcolumn=80             " Highlight columns > 80
set cursorline                 " Highlight the current line
filetype off                   " required
set syntax=eslint

" ## Paste toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" ## Windows split configuration
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

" #######  GENERAL SETTINGS  #######

" ## Active theme
if &t_Co >= 256 || has("gui_running")
  colorscheme railscasts
endif

" ## Remove Trailing White Space automatically on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" ## autocmd FileType c,cpp,java,php,ruby,python autocmd
" ## BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" ## Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" ## Toggle relative number lines
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" #######  VUNDLE PLUGINS  #######

" ## Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ## Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" ## Basic Tools
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'matze/vim-move'

" ## Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ## Visual Enhancements
Plugin 'flazz/vim-colorschemes'
Plugin 'ap/vim-css-color'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'w0ng/vim-hybrid'

" ## Javascript
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Raimondi/delimitMate'
Plugin 'mxw/vim-jsx'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'

" ## Ruby & Ruby and Rails
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-liquid'
Plugin 'janko-m/vim-test'

" ## SCSS
Plugin 'cakebaker/scss-syntax.vim'

" ## Syntastic Linting
Plugin 'scrooloose/syntastic'

" ## plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'"

" ## Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'"

" ## git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'"

" ## The sparkup vim script is in a subdirectory of this repo called vim.
" ## Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}""

" ## Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
"  Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" #######  PLUGIN SETTINGS  #######

" ## Ack
let g:ackprg = "/usr/bin/ack"

" ## CTRL-P
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|tmp\|dist'

" ## NERDTree set on startup
let g:nerdtree_tabs_open_on_console_startup=1

" ## NERDTree ignore files
set wildignore+=/tmp/,*/tmp/*,*.so,*.swp,*.zip

" ## Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['eslint']

if has("autocmd")
  au  BufNewFile,BufRead *.mustache,*.hogan,*.hulk,*.hjs set filetype=html.mustache syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
  au  BufNewFile,BufRead *.handlebars,*.hbs set filetype=html.handlebars syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
endif

" ## Disable HTML Tidy

let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

" ## Emmet
" To use Emmet, always remember to press , after key map
let g:user_emmet_leader_key = '<c-z>'

