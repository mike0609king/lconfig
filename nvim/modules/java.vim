
" (default) compilation
autocmd filetype java nnoremap <F5> :w <bar>!javac "%"<cr>
autocmd filetype java nnoremap <F4> :w <bar>!java "%:r"<cr>
