set nocompatible              " be iMproved, required
filetype on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'xuhdev/vim-latex-live-preview'
"Plugin 'cohlin/vim-colorschemes'
"Plugin 'vivkin/flatland.vim'
"Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'hzchirs/vim-material'

colorscheme ron
"Plugin 'blueshirts/darcula'
"Plugin 'inu7el/darcula'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set shell=/bin/bash

set ttyfast

" Leader Mappings
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :qall<CR>


" Toggle nerdtree with F10
map <Leader>t :NERDTreeToggle<CR>
" Current file in nerdtree
"map <F9> :NERDTreeFind<CR>

" Reduce timeout after <ESC> is recvd. This is only a good idea on fast links.
set ttimeout
set ttimeoutlen=20
set notimeout

set cursorline


"key to insert mode with paste using F2 key
map <Leader>i :set paste<CR>i
" Leave paste mode on exit
au InsertLeave * set nopaste

" Command aliases
cabbrev tp tabprev
cabbrev tn tabnext
cabbrev tf tabfirst
cabbrev tl tablast

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=500
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " highlight matches
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Fuzzy finder: ignore stuff that can't be opened, and generated files
"let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
"endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" bind K to search word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Softtabs, 4 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    let g:airline_right_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_left_alt_sep= ''
    let g:airline_left_sep = ''
endif
let g:airline_symbols.space = "\ua0"
"let g:airline_theme='tomorrow'
"let g:airline_theme='darcula'
let g:airline_theme='solarized'
set t_Co=256

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

:set smartcase
:set ignorecase
:set noantialias

" Color scheme
"colorscheme solarized
"colorscheme darcula
"colorscheme flatland
"colorscheme py-darcula
"colorscheme base16-tomorrow-night
set background=dark
set encoding=utf-8

" Numbers
set number
set numberwidth=5

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Switch between the last two files
nnoremap <leader><leader> <c-^>

let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

nmap <leader>swl  :topleft  vnew<CR>
nmap <leader>swö :botright vnew<CR>
nmap <leader>swk    :topleft  new<CR>
nmap <leader>swj  :botright new<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
if filereadable($HOME . "/.vimrc.local")
" Remove trailing whitespace on save for ruby files.
function! s:RemoveTrailingWhitespaces()
  "Save last cursor position
  let l = line(".")
  let c = col(".")

  %s/\s\+$//ge

  call cursor(l,c)
endfunction
au BufWritePre * :call <SID>RemoveTrailingWhitespaces()
endif

" cmd n, cmd p for fwd/backward in search
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Easy navigation between splits. Instead of ctrl-w + j. Just ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-Ö> <C-W><C-L>
nnoremap <C-L> <C-W><C-H>
nnoremap ö l
nnoremap l h

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>h
nnoremap <C-ö> <C-w>l
" Placeholder
nnoremap <Leader>j <Esc>/<++><Enter>c4l
