autocmd filetype json nnoremap <F3> :w<bar>:%!python3 -m json.tool --indent 2<cr>
