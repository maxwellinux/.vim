" Path: $HOME/.vim/vimrc
" Date: Mon Feb 3 CST 2020

" ===
" plug.vim
" ===
if empty(glob($HOME.'/.vim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" setting options
" ===
set encoding=utf-8
set langmenu=en_US.UTF-8
set nocompatible
set updatetime=1000
set timeoutlen=500
set autowrite
set autoread
set list
set textwidth=80
set tabstop=4
set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4
set listchars=tab:▶\ ,trail:●
set cursorline
set number
set relativenumber
set wrap
set scrolloff=3
set ruler
set cmdheight=1
set laststatus=2
set autochdir
set formatoptions-=tc
set showcmd
set showmode
set wildmenu
set wildignore=log/**,tmp/**
set wildmode=longest,list,full
set nobackup
set nowritebackup
set noswapfile
let mapleader=' '
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
syntax on
syntax enable
map <LEADER>r :w<CR>:source ~/.vim/vimrc<CR>
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set hlsearch
set incsearch
set ignorecase
set smartcase
exec 'nohlsearch'
noremap <LEADER><CR> :nohlsearch<CR>
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" ===
" running
" ===
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec 'w'
  if &filetype ==# 'sh'
    silent! exec '!clear'
    :!time bash %
  elseif &filetype ==# 'c'
    silent! exec '!clear'
    exec '!g++ % -o %<'<CR>
    exec '!time ./%<'
  elseif &filetype ==# 'cpp'
    silent! exec '!clear'
    exec '!g++ % -o %<'<CR>
    exec '!time ./%<'
  elseif &filetype ==# 'python'
    silent! exec '!clear'
    exec '!time python3 %'
  elseif &filetype ==# 'html'
      silent! exec '!chromium % &'
  endif
endfunc

" ===
" plug-in
" ===
call plug#begin('~/.vim/plugged')
" vim theme
Plug 'morhetz/gruvbox'

" multiple cursors
Plug 'terryma/vim-multiple-cursors'

" shortcut for changing
Plug 'amix/open_file_under_cursor.vim'
call plug#end()

" ===
" gruvbox
" ===
colorscheme gruvbox
set background=dark
" Transparent:
" highlight Normal guibg=NONE ctermbg=None

" ===
" vim-multiple-cursors
" ===
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<c-k>'
let g:multi_cursor_next_key            = '<c-n>'
let g:multi_cursor_prev_key            = '<c-l>'
let g:multi_cursor_skip_key            = '<c-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" ===
" header
" ===
func FileHeader()
  if &filetype ==# 'sh'
    call setline(1,'#! /bin/bash')
  endif
endfunc
autocmd BufNewFile * exec ":call FileHeader()"

" ===
" source
" ===
source ~/.vim/shortcut.vim
