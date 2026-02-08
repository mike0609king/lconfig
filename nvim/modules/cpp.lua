-- C++ settings
--
-- setup for c++ compilation
vim.cmd([[
autocmd filetype cpp nnoremap <F5> :w <bar>!g++ -Wshadow -Wextra -Wall "%" -o "%:r" -g -fsanitize=address -D DEBUG -fsanitize=undefined<cr>
autocmd filetype cpp nnoremap <F4> :w <bar>!./"%:r"<cr>
]])
