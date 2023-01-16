" -------- USABILITY CONFIGURATION -------- "

" Don't make vim compatible with vi
set nocompatible

syntax on
set number
set relativenumber

" Make Vim detect file types and load specific plugins
set autoread
filetype on
filetype plugin on 
filetype indent on

" Default fold method
set foldmethod=indent
set foldlevel=5

" Remap scape in insert mode
inoremap jk <ESC>

" Remap symbols for american keyboard [TEMPORA]
inoremap º <
inoremap ª >

" Block Selection
nnoremap <A-Q> <C-V>

" Default encoding is UTF-8
set encoding=utf-8
set fileencoding=utf-8

" Make backspace fucntion as expected
set backspace=indent,eol,start

" Disable errorbell
set noerrorbells
set vb t_vb=

" Don't unload buffers when abandoned
set hidden

" Set UNIX line endings
set fileformat=unix
set fileformats=unix,dos

" Optimize screen refresh
"set lazyredraw

" Set colorscheme
try
    colorscheme mydesert
catch
endtry

" Set split order
set splitright

" Navigating tags
nnoremap <C-g> <C-]>

" Block selection
nnoremap Q <C-v>

" -------- CUSTOMIZATION -------- "
let mapleader=','
let maplocalleader='º'

set wildmode=list:full

" Remove the .ext~ files
set nobackup
set writebackup
set noswapfile

" Search settings
set incsearch
set hlsearch
nnoremap <silent><expr> <leader>h (&hls && v:hlsearch ? ':nohls' : 'set hls')."\n"
nnoremap n nzz
nnoremap N Nzz

" Indentation settings
set expandtab			" Use spaces instead of tabs
set autoindent			" Autoindent based on line above
set smartindent
set shiftwidth=4
set softtabstop=4

" Set max line width
set textwidth=80

" Folding settings
nnoremap <space> za

" Insert date
nnoremap <leader>. "=strftime("%a %d/%m/%Y %H:%M:%S ")<C-M>p<Esc>
nnoremap <leader>: "=strftime("%d/%m/%Y %H:%M:%S ")<C-M>pi<Esc>

" Quick Scape
nnoremap <leader>Q :qa!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>

" Control switch between windows
nnoremap <silent> <C-J> <C-W><C-J>
nnoremap <silent> <C-H> <C-W><C-H>
nnoremap <silent> <C-L> <C-W><C-L>
nnoremap <silent> <C-K> <C-W><C-K>

" Easy tab
vnoremap > >gv
vnoremap < <gv

" Quick visual block
nnoremap <C-q> <C-v>"

" Quick access to settings
nnoremap <leader>c :tabnew ~/.vimrc<cr>

" Remap vim 0 to first non-black character
nnoremap 0 ^

" Clipboard
set clipboard=unnamedplus

" tab maps
nnoremap g1 1gt
nnoremap g2 2gt
nnoremap g3 3gt
nnoremap g4 4gt

" Open terminal
nnoremap tt :vertical terminal<cr>

" Quick running in other pane (tmux)
nnoremap <F6> :nnoremap \<F5\> :!tmux send-keys -t "1:1.1" 'clean' Enter './%' \<cr\> 

" ------- PLUGIN CONFIGURATION -------- "
let &runtimepath.=",$HOME/.vim/bundle/Vundle.vim"
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'vim-script/L9'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'vim-script/FuzzyFinder'
        " Mappings
        nnoremap <silent> <leader>ff :FufCoverageFile<CR>
        nnoremap <silent> <leader>fb :FufBuffer<CR>
        nnoremap <silent> <leader>fh : FufHelp<CR>
    Plugin 'scrooloose/nerdtree'
        " Options
        let NERDTreeChDirMode=2
        " Mappings
        nnoremap <leader>t :NERDTreeToggle<CR>
        nnoremap gff :NERDTreeFind<cr>
    Plugin 'neocline/coc.nvim', {'branch' : 'relese'}
        " Options
        " Mappings
        nnoremap gd <Plug>(coc-definition)
        nnoremap gr <Plug>(coc-references)
    Plugin 'kana/vim-fakeclip'
        " Mapping
        nmap <leader>d "+d
        nmap <leader>D "+D
        nmap <leader>y "+y
        nmap <leader>Y "+Y
        nmap <leader>yy "+yy
        vmap <leader>y "+y
        vmap <leader>Y "+Y
        nmap <leader>p "+p
        nmap <leader>P "+P
call vundle#end()

" -------- SYNTAX -------- "
augroup python
    autocmd!
    autocmd BufNewFile,BufRead *.py
        \ noremap <F5> :!clear && python3 %<cr>|
        \ noremap <leader><F5> :!ipython3 -i % <cr>
augroup END
