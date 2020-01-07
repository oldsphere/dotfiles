" -------------------- USABILITY CONFIGURATION --------------------

" don't make vim copatible with vi
set nocompatible

"turn on syntax highlight
syntax on
" show lines
set number

" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

" reload files changed outside vim
set autoread

" Indent fold method
set foldmethod=indent 
set foldlevel=5

"encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

" by default, in insert mode backspace won't delete over line breaks, or 
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start

" Disable errorbell
set noerrorbells
set vb t_vb=

" dont't unload buffers when they are abandoned, instead stay in the
" background
set hidden

" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw

" set color scheme
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

try
	colorscheme mydesert
catch
endtry
"
"Set split order
set splitright

" ---------------------- CUSTOMIZATION ----------------------
"  The following are some extra mappings/configs to enhance my personal
"  VIM experience

" set , as mapleader
let mapleader = ","
let maplocalleader = "º"

" map numeric pad up/down to prev/next buffer
nnoremap 8 :bp<CR>
nnoremap 2 :bn<CR>

" suggestion for normal mode commands
set wildmode=list:longest

" remove the .ext~ files, but not the swapfiles
set nobackup
set writebackup
set noswapfile

" search settings
set incsearch        " find the next match as we type the search
set hlsearch         " hilight searches by default
" use ESC to remove search higlight
nnoremap <silent><expr> <leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" keep the cursor visible within 3 lines when scrolling
set scrolloff=3


" indentation
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages
set shiftwidth=4    " when reading, tabs are 4 spaces
set softtabstop=4   " in insert mode, tabs are 4 spaces

" no lines longer than 80 cols
set textwidth=80

"select all mapping
noremap <leader>a ggVG

" make a mark for column 80
""set colorcolumn=80
" and set the mark color to DarkSlateGray
""highlight ColorColumn ctermbg=lightgray guibg=lightgray

" Folding with spacebar
nnoremap <space> za

"Insert date
nnoremap <leader>. "=strftime("%a %d/%m/%Y %H:%M:%S ")<C-M>p<Esc>
nnoremap <leader>: "=strftime("%d/%m/%Y %H:%M:%S ")<C-M>pi<Esc>

" Open NERDTree
nnoremap <leader>t :NERDTreeToggle <CR>

" quick escpae
nnoremap <leader>Q :q!<CR>
nnoremap <leader>q :q<CR>

" Move lines up and down
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp

" Control to switch between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easy tab
vnoremap > >gv
vnoremap < <gv

" Centered search
nnoremap n nzz
nnoremap N Nzz
" Remap VIM 0 to first non-blank character
nnoremap 0 ^

" Clipboard
set clipboard=unnamed
nmap <localleader>d "+d
nmap <localleader>D "+D
nmap <localleader>y "+y
nmap <localleader>Y "+Y
nmap <localleader>yy "+yy
vmap <localleader>y "+y
vmap <localleader>Y "+Y
nmap <localleader>p "+p
nmap <localleader>P "+P

" -------------------- PLUGIN CONFIGURATION --------------------
"  initiate Vundle
let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" start plugin definition
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
"Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kana/vim-fakeclip'
Plugin 'plasticboy/vim-markdown'
" end plugin definition

call vundle#end()            " required for vundle

" -------------------- SYNTAX  --------------------
augroup filetype_markdown
    autocmd!
    autocmd BufNewFile,BufRead *.md
        \ nnoremap <buffer> <localleader>e :call MarkdownMarkErrorLine()<CR>|
        \ vnoremap <buffer> <localleader>e :call MarkdownMarkErrorLine()<CR>|
        \ nnoremap <buffer> <localleader>w :call MarkdownMarkWarningLine()<CR>|
        \ vnoremap <buffer> <localleader>w :call MarkdownMarkWarningLine()<CR>|
        \ nnoremap <buffer> <localleader>b :call MarkdownMarkCheckBox()<CR>|
        \ vnoremap <buffer> <localleader>b :'<,'>call MarkdownMarkCheckBox()<CR>|
        \ nnoremap <buffer> <CR> :call MarkdownToggleCheckBox()<CR>|
        \ vnoremap <buffer> <CR> :'<,'>call MarkdownToggleCheckBox()<CR> |
        \ nnoremap <buffer> <localleader>s $o<esc>80i=<esc>o
augroup END

augroup web_dev
    autocmd!
    autocmd BufNewFile,BufRead *.html
        \ inoremap <buffer> <F8> </<C-X><C-O><Esc>bhhi
augroup END
