" LaTeX settings
autocmd filetype tex set wm=2	" sets a wrap margin of 2 characters from the right window border
autocmd filetype tex setlocal indentexpr=

" LaTeX mappings
autocmd filetype tex nnoremap <F5> :w<bar>:b1<bar>:!pdflatex "%"<cr>:b#<cr>
autocmd filetype tex nnoremap <F4> :w<bar>:b1<bar>:!pdflatex "%"<cr>:b#<cr>
autocmd filetype tex set spell
autocmd filetype tex set spell spelllang=en_us,de

" Latex snippets mappings
autocmd filetype tex nnoremap ,main :-1read ~/lconfig/nvim/snippets/latex/main.tex <bar> :!cp ~/lconfig/nvim/snippets/latex/myDefaultPackageSetup/ . && chmod -R +w myDefaultPackageSetup && mkdir includings && chmod -R +w includings<cr><cr>
autocmd filetype tex nnoremap ,bmain :-1read ~/lconfig/nvim/snippets/latex/bmain.tex <bar> :!cp -r ~/lconfig/nvim/snippets/latex/myDefaultPackageSetup/ . && chmod -R +w myDefaultPackageSetup && mkdir includings && chmod -R +w includings<cr><cr>
