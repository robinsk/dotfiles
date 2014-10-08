" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" Key mappings
nmap \l setlocal number!<CR>

" colors
syntax on
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal" || $TERM_PROGRAM == "iTerm.app"
    set t_Co=256
    colors twilight256
else
    colors twilight
endif

if has('autocmd')
    " load indentation rules and plugins according to detected filetype
    filetype plugin indent on
endif

" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set autoindent
set backspace=indent,eol,start " allow backspace all over the place
set smarttab

set showcmd " show (partial) command in status line
set showmatch " show matching brackets
set ignorecase " case-insensitive matching
set smartcase " smart case mathing (insensitive except when contains uppercase)
set incsearch " incremental search
set autowrite " automatically save before commands like :next and :make
set hidden " hide buffers when they are abandonded
"set mouse=a " enable mouse usage (all modes)

"set textwidth=78 " maximum width of text that is being inserted
set tabstop=4 " number of spaces that a <Tab> in the file counts for
set shiftwidth=4 " number of spaces to use for each step of (auto)indent
set softtabstop=4 " number of spaces that a <Tab> counts for while performing editing operations
set expandtab " use the appropriate number of spaces to insert a <Tab>

set laststatus=2 " always show status line
set ruler " show line and column etc

if !&scrolloff
    set scrolloff=1 " show <num> lines around where editing
endif
if !&sidescrolloff
    set sidescrolloff=5 " show <num> columns around where editing
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
    set encoding=utf-8
endif

if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
        let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
    endif
endif

set autoread " automatically read file when changed outside of vim and not modified in vim

if &history < 1000
    set history=1000
endif


