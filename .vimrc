execute pathogen#infect()
call plug#begin('~/.vim/plugged')
Plug 'vhda/verilog_systemverilog.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'vim-scripts/Conque-GDB'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'paranoida/vim-airlineish/'
Plug 'wesQ3/vim-windowswap'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Konfekt/FastFold'
Plug 'vimtaku/hl_matchit.vim'
Plug 'jreybert/vimagit'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Plug 'vim-latex/vim-latex'
Plug 'miyakogi/seiya.vim'
Plug 'altercation/vim-colors-solarized'
call plug#end()

set encoding=utf-8
set expandtab
set visualbell
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
if has("autocmd")
filetype plugin indent on
endif
set bs=2
set ttyfast
set mouse=a
set ttymouse=xterm
let g:SuperTabDefaultCompletionType = 'context'
runtime macros/matchit.vim
let g:airline_theme='airlineish'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2

nmap <F8> :TagbarToggle<CR>

"Trailing White space highlighting + removal
nnoremap <silent> <F4> :match ExtraWhitespace /\s\+\%#\@<!$/<CR>
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_verilog_checkers = ['iverilog']

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>
set splitbelow
set splitright

"Leader+l = toggle highlighting
set hlsearch
let hlstate=0
nnoremap <silent> <leader>l :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>
"next and previous buffers with tab
nnoremap <silent> <leader><tab> :bn<cr>
nnoremap <silent> <S-tab> :bp<cr>

" This fixes vim lag with airline enables
set ttimeoutlen=1
" This fixes lag with verilog folding
let g:verilog_systemverilog_fold = 1
"clone paragraph with cp
noremap cp yap<S-}>p
set pastetoggle=<leader>z "Paste mode
"Playback macro with Q. record with qq and stop with q.
nnoremap Q @q
vnoremap Q :norm @q<cr>
"Tab with shift+directio
nnoremap <S-l> gt
noremap <S-h> gT
"Align paragraph block
noremap <leader>a =ip
"Ctrl+direction change panes
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

"relative numbering. One of the plugins imrpoves on ths
set rnu
":setlocal spell spelllang=en_us


let g:NERDSpaceDelims = 1
let g:NERDAltDelims_c = 1
let g:NERDTrimTrailingWhitespace = 1

let g:tmux_navigator_save_on_switch = 1
set background=dark
colorscheme solarized

"Transparent Background in term
hi Normal ctermbg=NONE
hi NonText ctermbg=none
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
