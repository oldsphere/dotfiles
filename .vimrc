
"""""""""""""""""""""""""""""""""""""
"		VUNDLE SETTINGS             "
"""""""""""""""""""""""""""""""""""""

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on

" Add all your plugins here 
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'plasticboy/vim-markdown'
Plugin 'powerline/powerline'
Plugin 'tpope/vim-surround'

source ~/.vim/plugin/TODO.vim


"""""""""""""""""""""""""""""""""""""
"            SHORT-CUTS             "
"""""""""""""""""""""""""""""""""""""
let g:NERDTreeChDirMode=2
let g:fuf_keyOpen='<Tab>'
let mapleader=","

" Remap o/O for adding new lines
"nnoremap <C-o> o<esc><esc>
"nnoremap <C-O> O<esc><esc>

" Folding with spacebar
nnoremap <space> za

" Open search map
map <leader>f :FufFileWithFullCwd <CR>
map <leader>F :FufDirWithFullCwd <CR>

" Search the cursor selected workd on help
map <leader>h "zyiw:exe "h ".@z.""<CR> 

" reload .vimrc
nnoremap <leader>r :so $MYVIMRC<CR>:echo ".vimrc reloaded!"<CR>

" Activate higlight
"let g:hlstate=1
"noremap <leader>h :if (hlstate == 1) \| set hlsearch \| else \| nohlsearch \| endif \| let hlstate=1-hlstate<CR><CR>

"Insert date
"nnoremap <leader>. :pu!=strftime('%a %d/%m/%Y  %H:%M:%S')<CR> "LEGACY
nnoremap <leader>. "=strftime("%a %d/%m/%Y %H:%M:%S ")<C-M>p
nnoremap <leader>: "=strftime("%d/%m/%Y %H:%M:%S ")<C-M>pi 

" Very magic search
nnoremap / /\v
nnoremap ? ?\v

" Quick replace
nnoremap <S-R> :%s/

" Open NERDTree
map <leader>t :NERDTreeToggle <CR>

" Quick save 
nnoremap <leader>w :w<CR>

" Select all
"map <C-a> ggVG

" quick escpae
nnoremap <leader>q :q<CR>

" Move lines up and down
nnoremap <C-Down> ddp
nnoremap <C-Up> ddkP
"nnoremap <Left> <Nop>
"nnoremap <Right> <Nop>

" Control to switch between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
    
" Easy tab
vnoremap > >gv
vnoremap < <gv

nnoremap n nzz
nnoremap N Nzz
" Edit .vimrc
map <leader>c :tabnew <CR>:edit ~/.vimrc<CR>

" Edit system/TODO
map <silent> <leader>s :call TODO_Open()<CR>

""""""""""""""""""""""""""""""""""""""""""
"            GENERAL CONFIGUATION  		 "
""""""""""""""""""""""""""""""""""""""""""

"Set split order
set splitright
" Indent fold method
set foldmethod=indent 
set foldlevel=99
set lazyredraw
set ttyfast

" Clipboard
set clipboard=unnamedplus

" Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap=<,>,h,l

" Turn backup off
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Smart tabs activated
set smarttab

" 1 tab== 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 chracters
set lbr
set tm=99

set ai  "Auto indent"
set si "Smart indent"
set wrap "Wrap lines"

" Setup Satus line
set laststatus=2
set magic
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD: %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Columns:\ %c
set statusline=\ %F%m%r\ \ \ \ \ Line:\ %l\ \ Columns:\ %c

" Remap VIM 0 to first non-blank character
map 0 ^

""""""""""""""""""""""""""""""""""
"		     SYNTAX	          	 "
""""""""""""""""""""""""""""""""""

syntax enable

if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

try
	colorscheme desert
catch
endtry
highlight Search guibg=blue guifg='NONE'

" Break the lines to fix the text width
set textwidth=79
set fo+=t

" link mapping
map <leader>u :call HandleURL()<CR><CR>
noremap <leader>o :call HandlePDF()<CR><CR>
"noremap <leader>o :call HandleTXT()<CR><CR>

"
"Remove the timeout between commands
set notimeout nottimeout


""""""""""""""""""""""""""""""""""""""""
"           FILE SPECIFIC              "
""""""""""""""""""""""""""""""""""""""""

augroup nonvim " {{{2
    au!
    au BufRead *.png,*.jpg,*.gif,*.xls*,*.scpt sil exe "!xviewer " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!
    au BufRead *.pdf sil exe "!okular """ . shellescape(expand("%:p")) . """ &>/dev/null &" | bd | let &ft=&ft | redraw!
augroup end

" Note file configuration
au BufNewFile,BufRead *.note 
    \ set tabstop=4 |
    \ set textwidth=79 |
    \ set fo+=t |
    \ let g:ycm_auto_trigger=0

au BufNewFile,BufRead *.tex noremap <F5> :!clear;latex2pdf %:p<CR>

" Python file configuration
au BufNewFile,BufRead *.py 
	\ set tabstop=4 |
	\ set softtabstop=4  |
	\ set shiftwidth=4  |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent | 
	\ set fileformat=unix |
	\ set number |	
	\ set foldmethod=indent |
	\ set foldlevel=99 |
    \ nnoremap <F5> :!clear;python3 %<CR>|
    \ nnoremap <leader><F5> :!clear;python3 -i %<CR>

"augroup helpfiles
"  au!
"  au BufRead,BufEnter */doc/* wincmd L
"augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""
"               Functions                       "
"""""""""""""""""""""""""""""""""""""""""""""""""

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction


function! CmdLine(str)
    exe "menu Foo.Bar" . a:str
    emenu Foo.Bar
    umenu Foo
endfunction


function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  echo s:uri
  if s:uri != ""
    exec "!firefox '".s:uri."'&"
  else
    echo "No URI found in line."
  endif
endfunction

function! HandleTXT()
  let s:uri = matchstr(getline("."), '.\+\.[tT][xX][Tt]')
  echo s:uri
  if s:uri != ""
      exec "vsplit ".s:uri
  else
     echo "No URI found in line."
  endif
endfunction

function! HandlePDF()
  let s:uri = matchstr(getline("."), '.\+\.[pP][dD][fF]')
  echo s:uri
  if s:uri != ""
    exec "!okular '".s:uri."' &>/dev/null &"
  else
     echo "No URI found in line."
  endif
endfunction

function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  "let winnr = bufwinnr('^' . command . '$')
  "silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
  let winnr = bufwinnr('^output_command$')
  silent! execute  winnr < 0 ? 'botright new ' . fnameescape('output_command') : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap 
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  "silent! execute 'resize ' . line('$')
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

