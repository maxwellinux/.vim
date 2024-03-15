augroup mine | autocmd FileType * nnoremap K 8k
augroup mine | autocmd FileType * nnoremap J 8j
augroup mine | autocmd FileType * nnoremap H 3b
augroup mine | autocmd FileType * nnoremap L 3w

"dependency: xclip"
augroup mine | autocmd FileType * vnoremap Y :w !xclip -i -sel c<CR><CR>
