call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'SirVer/ultisnips'

" Colorschemes
" Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'

call plug#end()

set encoding=utf-8
syntax on
let g:mapleader=' '
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
colorscheme jellybeans 
set background=dark
set number
set expandtab
set tabstop=2
set hlsearch
set incsearch
set mouse=a

" mappings

map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)

map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR> 


function! WinMove(key) 
let t:curwin = winnr() 
exec "wincmd ".a:key
if (t:curwin == winnr())
if (match(a:key,'[jk]'))
wincmd v
 else
wincmd s
endif
exec "wincmd ".a:key
endif
endfunction

filetype plugin indent on
" show existing
" tab with 4
" spaces width
set tabstop=2
" with '>', use 4
" spaces width
set shiftwidth=2
" On pressing
" tab, insert 4
" spaces
set expandtab

set cc=120

set list listchars=tab:»·,trail:·

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
augroup END
