" ################################################
" extentions
" remove: CocUninstall <extention-name>
" CocInstall coc-pyright
"\ 'coc-python',
"\ 'coc-vimtex',
"\ 'coc-clangd',
" ################################################

let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-eslint',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-cssmodules',
    \ 'coc-python',
    \ 'coc-flutter',
    \ 'coc-ccls'
    \]

" coc-pairs
"
let b:coc_pairs_disabled = ['<']
autocmd FileType tex let b:coc_pairs = [["$", "$"], ["(", ")"], ["[", "]"], ["{", "}"]]
set runtimepath+=~/.vim/plugged/coc.nvim/plugin/coc.vim

" completely disable coc for certain files
" autocmd filetype cpp set runtimepath-=~/.vim/plugged/coc.nvim
" autocmd filetype python set runtimepath-=~/.vim/plugged/coc.nvim
" autocmd filetype tex set runtimepath-=~/.vim/plugged/coc.nvim

" coc-<language> --> completion
"
" use <tab> for trigger completion and navigate to the next complete item

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" navigation in the completion list with <Tab> and <S-Tab>
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()							" navigation with <Tab>
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"	" navigation with <S-Tab>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"		" confirm completion with <cr> (space) 

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" GoTo code navigation 
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" toggle diagnostics
nnoremap <silent> [d :call CocAction('diagnosticToggle')<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
