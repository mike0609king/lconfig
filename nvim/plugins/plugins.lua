local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
-- Auto completion
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp-signature-help')
-- Plug('f3fora/cmp-spell')

-- file managing
Plug('junegunn/fzf', { ['do'] = function() vim.fn['fzf#install']() end })
Plug('junegunn/fzf.vim')

-- snippets
Plug('SirVer/ultisnips')
Plug('quangnguyen30192/cmp-nvim-ultisnips')

-- Looks of vim
Plug('morhetz/gruvbox')
Plug('ap/vim-css-color')
vim.call("plug#end")

dofile(vim.g.pluginsPath .. "colorscheme.lua")
dofile(vim.g.pluginsPath .. "fzf.lua")
dofile(vim.g.pluginsPath .. "nvim_cmp_ultisnips.lua")
dofile(vim.g.pluginsPath .. "lspconfig.lua")
