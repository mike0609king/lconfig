" C settings
"
" setup for c compilation
autocmd filetype c nnoremap <F5> :w <bar>!clang "%" -o "%:r" -lm -fsanitize=address<cr>
autocmd filetype c nnoremap <F4> :w <bar>!./"%:r"<cr>
