"MUST BE FIRST THING
set nocompatible 

"Attempt to determine the type of a file based on its name and possibly its
"contents. Use this to allow intelligent auto-indenting for each filetype,
"and for plugins that are filetype specific.
filetype indent on
filetype plugin on

"Use pathogen to load plugins from bundle directory
execute pathogen#infect()
call pathogen#helptags()

"Start NerdTree on startup
"autocmd vimenter * NERDTree

"Set focus to non nerdtree window
"autocmd VimEnter * wincmd w

"Set nerdtree on the right
"let g:NERDTreeWinPos = "right"

"Set size of nerdtree
"let g:NERDTreeWinSize=20

"Enable Autocomplete
let g:neocomplete#enable_at_startup=1

"Enable syntax highlighting
syntax enable

"Allows buffers to be hidden
set hidden

"Disable word wrap
set nowrap

"Show line numbers
set number

"Turn off Search highlighting
set nohlsearch

"Show partial commands in the last line of the screen
set showcmd

"Modelines have historically been a source of security vulnerabilities. As
"such, it may be a good idea to disable them and use the securemodelines
"script, <http://www.vim.org/scripts/script.php?script_id=1876>.
set nomodeline

"Instead of failing a command because of unsaved changes, instead raise a
"dialogue asking if you wish to save changed files.
set confirm

"Disable default splash text
set shortmess+=Iat

"Sets how many lines of history VIM has to remember
set history=1000



"Show matching brackets when text indicator is over them
set showmatch 

"Ignore case when searching
set ignorecase

"Set command line height to avoid Hit Enter to to continue prompts
set cmdheight=1

"No annoying sound on errors
set noerrorbells
set novisualbell
set noeb vb t_vb=
set tm=500

"Set utf8 as standard encoding
set encoding=utf-8      "The encoding displayed.
set fileencoding=utf-8  "The encoding written to file.

"Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"Use spaces instead of tabs
set expandtab

"1 tab == 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

"Use multiple shiftwidths when indenting with <, >
set shiftround

"turn on indent
"set foldmethod=manual
set foldlevel=1
set nofoldenable

"Always show the status line
set laststatus=2

"statusline
"cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"format markers:
"  %< truncation point
"  %n buffer number
"  %f relative path to file
"  %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"  %r readonly flag [RO]
"  %y filetype [ruby]
"  %= split point for left and right justification
"  %-35. width specification
"  %l current line number
"  %L number of lines in buffer
"  %c current column number
"  %V current virtual column number (-n), if different from %c
"  %P percentage through buffer
"  %) end of width specification
"set statusline+=[%t%m%r%h][%{getcwd()}]%y[%{&fileencoding?&fileencoding:&encoding}][Line:%l/%L][Col:%c]
set statusline+=%m[%t]\ %y%=[Buf:%n]\ [%{&fileencoding?&fileencoding:&encoding}]\ [Line:%l/%L]\ [Col:%c]

"Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Don't redraw while executing macros (good performance config)
set lazyredraw

"Highlight search results
set hlsearch

"show search matches as you type
set incsearch

"insert tabs at the start of a line according to shiftwidth not tabstop
set smarttab

"80 col lines
set textwidth=80

"set autoindenting on
set autoindent

set colorcolumn=80

"Set to auto read when a file is changed from the outside
set autoread

"augroup myvimrc
"    au!
"    au BufWritePost .vimrc, _vimrc, vimrc so $MYVIMRC 
"    ".gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
"    augroup END

set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=T  "remove toolbar
set guioptions+=m  "add menu bar

"Sets :W to do the same as :w
command! W write

if has("gui_running")
    "initial size
    set lines=50 columns=120

    set background=dark
    colorscheme molokai  

    "set guifont=Input:h09,Liberation_Mono:h09,Consolas:h09,Fixedsys:h09
    set guifont=Input:h9
    


    "file based theme changing 
    "Keep in gui section to avoid console color problems
    "autocmd BufEnter * colorscheme molokai 
    "autocmd BufEnter *.hpp colorscheme molokai 
    "autocmd BufEnter *.cpp colorscheme molokai 
    "autocmd BufEnter *.c colorscheme molokai 
    "autocmd BufEnter *.lua colorscheme github
    "autocmd BufEnter *.scm colorscheme molokai 
    "autocmd BufEnter *.py colorscheme molokai
    "autocmd BufEnter *.cs colorscheme molokai

else 
    "256 color mode
    set background=dark
    colorscheme solarized 
endif 




if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif
