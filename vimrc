call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'
"Plug 'kyazdani42/nvim-web-devicons' " for file icons
"Plug 'kyazdani42/nvim-tree.lua'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'f-person/git-blame.nvim'
Plug 'tpope/vim-rails'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'hoschi/yode-nvim'
Plug 'wakatime/vim-wakatime'
" Colorschemes
Plug 'morhetz/gruvbox'
" Plug 'nanotech/jellybeans.vim'
Plug 'github/copilot.vim'
Plug 'akinsho/toggleterm.nvim'
" Treesitter
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/playground'
"Plug 'romgrk/nvim-treesitter-context'
Plug 'preservim/nerdtree'
" BarBar
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
" Tagbar
" brew install --HEAD universal-ctags/universal-ctags/universal-ctags
Plug 'majutsushi/tagbar'
" Vim Fugitive
Plug 'tpope/vim-fugitive'
" Vim Fugitive plugin for github
Plug 'tpope/vim-rhubarb'
" Treesitter config
" lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
" lua require'savvinovan/nvim-tree'.setup {}
"

" disable go def mappings
let g:go_def_mapping_enabled = 0
let g:EasyMotion_do_mapping = 0
call plug#end()
autocmd vimenter * ++nested colorscheme gruvbox
set encoding=utf-8
set hlsearch!
syntax on

" harpoon config
nnoremap <leader>hrp :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <silent><C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><C-t> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><C-n> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><C-s> :lua require("harpoon.ui").nav_file(4)<CR>

nnoremap <C-n> :NERDTreeToggle<CR>

let g:mapleader=' '
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
set background=dark
set number
set expandtab
set tabstop=2
set incsearch
set mouse=a
""" -------------------- fzf-vim -------------------------
" Fuzzy-finder for vim

set rtp+=~/.fzf

" Customize fzf colors to match colorscheme
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, { 'options': ['--color', 'fg:252,bg:233,hl:#ff8787,fg+:252,bg+:235,hl+:#ff0000,info:0,prompt:161,spinner:135,pointer:135,marker:118'] }, <bang>0)

" Pin the fzf window at the bottom
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.3, 'xoffset': 0, 'yoffset': 100 } }

" vim-go settings
" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []
set completeopt-=preview
let g:go_doc_keywordprg_enabled = 0
" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

" highlight
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" mappings for telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" mappings

" map <C-n> :NvimTreeToggle<CR>

" mappings For EasyMotion
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f)

" mappings CocNext
let g:coc_enable_locationlist = 0
autocmd User CocLocationsChange CocList --no-quit --normal location

map <C-]> :CocNext<CR>
map <C-[> :CocPrev<CR>

map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR> 

nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gi :call GoImplements<CR>
nnoremap <silent> <leader>no :nohl<CR>

autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>ttp  <Plug>(go-run)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" YODE CONFIG
lua require('yode-nvim').setup({})
map <Leader>yc      :YodeCreateSeditorFloating<CR>
map <Leader>yr :YodeCreateSeditorReplace<CR>
nmap <Leader>bd :YodeBufferDelete<cr>
imap <Leader>bd <esc>:YodeBufferDelete<cr>
" these commands fall back to overwritten keys when cursor is in split window
map <C-W>r :YodeLayoutShiftWinDown<CR>
map <C-W>R :YodeLayoutShiftWinUp<CR>
map <C-W>J :YodeLayoutShiftWinBottom<CR>
map <C-W>K :YodeLayoutShiftWinTop<CR>
" at the moment this is needed to have no gap for floating windows
set showtabline=2

" WinMove bindings
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

" set list listchars=tab:»·,trail:·
set clipboard=unnamed

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

" TextEdit might fail if hidden is not set.
set hidden

autocmd ColorScheme * highlight CocErrorFloat guifg=#ffffff
autocmd ColorScheme * highlight CocInfoFloat guifg=#ffffff
autocmd ColorScheme * highlight CocWarningFloat guifg=#ffffff
autocmd ColorScheme * highlight SignColumn guibg=#adadad
autocmd ColorScheme * highlight CocWarningSign guibg=#ffffff

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Only show signcolumn on errors
set signcolumn=auto

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" COC CONFIG FOR GO
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>coca  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>coce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>cocc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>coco  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>cocs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>cocj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>cock  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>cocp  :<C-u>CocListResume<CR>

" FZF
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

" BarBar mappings
" Move to previous/next
nnoremap <silent>    gT :BufferPrevious<CR>
nnoremap <silent>    gt :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <M-<> :BufferMovePrevious<CR>
nnoremap <silent>    <M->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <M-1> :BufferGoto 1<CR>
nnoremap <silent>    <M-2> :BufferGoto 2<CR>
nnoremap <silent>    <M-3> :BufferGoto 3<CR>
nnoremap <silent>    <M-4> :BufferGoto 4<CR>
nnoremap <silent>    <M-5> :BufferGoto 5<CR>
nnoremap <silent>    <M-6> :BufferGoto 6<CR>
nnoremap <silent>    <M-7> :BufferGoto 7<CR>
nnoremap <silent>    <M-8> :BufferGoto 8<CR>
nnoremap <silent>    <M-9> :BufferGoto 9<CR>
nnoremap <silent>    <M-0> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <M-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <Leader>c :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseAllButCurrentOrPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-p>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used
