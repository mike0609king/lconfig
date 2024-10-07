call plug#begin('~/.vim/plugged')
" Auto completion
Plug 'neoclide/coc.nvim', {'branch':'release'}

" file managing
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" snippets (use vim-snippets for reference but don't install it)
Plug 'SirVer/ultisnips'

" Looks of vim
Plug 'morhetz/gruvbox'
Plug 'ap/vim-css-color' " display colors
call plug#end()

source $pluginsPath/myCoc.vim
source $pluginsPath/colorscheme.vim
source $pluginsPath/fzf.vim
source $pluginsPath/ultiSnips.vim
