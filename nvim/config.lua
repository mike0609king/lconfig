-- General configurations
vim.cmd([[
filetype plugin on
syntax enable
syntax on
]])

vim.o.compatible        = false
vim.o.relativenumber    = true
vim.o.number            = true
vim.o.autoindent        = true
vim.o.belloff           = "all"
vim.o.showcmd           = true                      -- Show (partial) command in status line.
vim.o.showmatch         = true                      -- Show matching brackets.
vim.o.ignorecase        = true                      -- Do case insensitive matching
vim.o.incsearch         = true                      -- Incremental search -> while searching you get the results
vim.o.autowrite         = true                      -- Automatically save before commands like :next and :make
vim.o.mouse             = "a"                       -- Enable mouse usage (all modes)
vim.o.wildmenu          = true                      -- uses a menu so that I can select the file if I use <tab> for completion in
vim.o.clipboard         = "unnamedplus"             -- activates clipboard ?
vim.o.wrap              = false                     -- code can go down go out of screen 
vim.o.hidden            = true
vim.o.encoding          = "utf-8"
vim.o.swapfile          = false
vim.o.backspace         = "indent,eol,start"        -- removing the restriction of the backspace so that it is possible to delete previously entered code (for Windows)

-- tabs
vim.o.expandtab         = true
vim.o.tabstop           = 4                         -- show existing tab with X spaces width
vim.o.softtabstop       = 0                         -- width of indentation span
vim.o.shiftwidth        = 4                         -- when indenting with '>', use X spaces width

vim.o.colorcolumn       = "80"                      -- not too long lines (max. 80 characters)

-- universal mappings
vim.g.mapleader=" "
vim.keymap.set("n", ",unfold", ":set foldlevel=100<cr>")
vim.keymap.set("n", ",all", "ggVG")
vim.keymap.set("n", ",clear", "ggVGd")
vim.keymap.set("n", "<leader>h", ":wincmd h<cr>")
vim.keymap.set("n", "<leader>j", ":wincmd j<cr>")
vim.keymap.set("n", "<leader>k", ":wincmd k<cr>")
vim.keymap.set("n", "<leader>l", ":wincmd l<cr>")
vim.keymap.set("n", "<leader>=", ":vertical resize +5<cr>") -- resize the vertical window (+)
vim.keymap.set("n", "<leader>-", ":vertical resize -5<cr>") -- resize the vertical window (-)

-- spelling mappings
vim.keymap.set("n", ",setd", ":set spell spelllang=en_us,de<cr>")
vim.keymap.set("n", ",seteng", ":set spell spelllang=en_us<cr>")
vim.keymap.set("n", ",setger", ":set spell spelllang=de<cr>")
vim.keymap.set("n", ",setnosp", ":set nospell<cr>")

-- mapping special characters for note
vim.keymap.set("i", '\\"o', "ö")
vim.keymap.set("i", '\\"u', "ü")
vim.keymap.set("i", '\\"a', "ä")
vim.keymap.set("i", "\\ss", "ß")
vim.keymap.set("i", '\\"O', "Ö")
vim.keymap.set("i", '\\"U', "Ü")
vim.keymap.set("i", '\\"A', "Ä")

vim.g.home = "/home/mike0609king/"
vim.g.modulesPath = vim.g.home .. "lconfig/nvim/modules/"
vim.g.pluginsPath = vim.g.home .. "lconfig/nvim/plugins/"

dofile(vim.g.modulesPath .. "buffersAndTabs.lua")
dofile(vim.g.modulesPath .. "cpp.lua")
dofile(vim.g.modulesPath .. "tex.lua")
dofile(vim.g.modulesPath .. "json.lua")

dofile (vim.g.pluginsPath .. "plugins.lua")

-- This is set at the end, because of bugs of vim-plug!
vim.cmd("filetype plugin indent off")