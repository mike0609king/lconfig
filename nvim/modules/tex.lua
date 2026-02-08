vim.cmd([[
autocmd filetype tex set wm=2	" sets a wrap margin of 2 characters from the right window border
autocmd filetype tex setlocal indentexpr=

autocmd filetype tex nnoremap <F5> :w<bar>:b1<bar>:!pdflatex "%"<cr>:b#<cr>
autocmd filetype tex nnoremap <F4> :w<bar>:b1<bar>:!pdflatex "%"<cr>:b#<cr>
autocmd filetype tex set spell
autocmd filetype tex set spell spelllang=en_us,de
]])
