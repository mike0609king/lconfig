call plug#begin('~/.vim/plugged')

" Auto completion
Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'alvan/vim-closetag'
Plug 'dart-lang/dart-vim-plugin'                   " Dart Syntax highlighting

" file managing
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" snippets (use vim-snippets for reference but don't install it)
Plug 'SirVer/ultisnips'

" Looks of vim
Plug 'morhetz/gruvbox'
Plug 'ap/vim-css-color' " display colors

Plug 'tpope/vim-surround'

call plug#end()

source $pluginsPath/myCoc.vim
source $pluginsPath/vim-closetag.vim
source $pluginsPath/colorscheme.vim
source $pluginsPath/nerdtree.vim
source $pluginsPath/fzf.vim
source $pluginsPath/ultiSnips.vim

function! JumpToCSS()
  let id_pos = searchpos("id", "nb", line('.'))[1]
  let class_pos = searchpos("class", "nb", line('.'))[1]

  if class_pos > 0 || id_pos > 0
    if class_pos < id_pos
      execute ":vim '#".expand('<cword>')."' **/*.css"
    elseif class_pos > id_pos
      execute ":vim '.".expand('<cword>')."' **/*.css"
    endif
  endif
endfunction

nnoremap <F9> :call JumpToCSS()<CR>
