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
vim.keymap.set("n", "<leader>yf", ":let @+=expand('%:p')<cr>")      -- copy current file name to system clipboard
vim.keymap.set("n", "<leader>yd", ":let @+=expand('%:p:h')<cr>")    -- copy current directory name to system clipboard
vim.keymap.set("n", "<leader>h", ":wincmd h<cr>")
vim.keymap.set("n", "<leader>j", ":wincmd j<cr>")
vim.keymap.set("n", "<leader>k", ":wincmd k<cr>")
vim.keymap.set("n", "<leader>l", ":wincmd l<cr>")
vim.keymap.set("n", "<leader>=", ":vertical resize +5<cr>") -- resize the vertical window (+)
vim.keymap.set("n", "<leader>-", ":vertical resize -5<cr>") -- resize the vertical window (-)

-- netrw (https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/)
vim.g.netrw_preview     = 1                                 -- preview is on right side, when clicking p in netrw
vim.g.netrw_winsize     = 30                                -- 30% window size
vim.g.netrw_banner      = 0                                 -- If you want to see the banner again, type I
vim.g.netrw_list_hide   = "\\(^\\|\\s\\s\\)\\zs\\.\\S\\+"   -- hide dot files
vim.keymap.set("n", "<leader>dd", ":e %:p:h<cr>")           -- open netrw in directory of current file
vim.keymap.set("n", "<C-n>", ":Lexplore<cr>")               -- open netrw in current working directory
vim.cmd([[
" H: Will "go back" in history.
" h: Will "go up" a directory.
" l: Will open a directory or a file.
" .: Will toggle the dotfiles.
" P: Will close the preview window.
" L: Will open a file and close Netrw.
" Leader dd: Will just close Netrw.
" Leader yd: copy current directory
" Leader yf: copy currently highlighted file
function! NetrwMapping()
    nmap <buffer> H u
    nmap <buffer> h -^
    nmap <buffer> l <CR>

    nmap <buffer> . gh
    nmap <buffer> P <C-w>z

    nmap <buffer> L <CR>:Lexplore<CR>
    nmap <buffer> <leader>dd :Lexplore<CR>
    nmap <buffer> <leader>yd :let @+=expand('%:p')<cr>
    nmap <buffer> <leader>yf yy:let @+=expand('%:p').@+<cr>
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
]])

-- spelling mappings
vim.api.nvim_create_user_command("SpellAll", "set spell spelllang=en_us,de", {})
vim.api.nvim_create_user_command("SpellG", "set spell spelllang=de", {})
vim.api.nvim_create_user_command("SpellE", "set spell spelllang=en_us", {})
vim.api.nvim_create_user_command("SpellNo", "set nospell", {})

-- mapping special characters for note
vim.keymap.set("i", '\\"o', "ö")
vim.keymap.set("i", '\\"u', "ü")
vim.keymap.set("i", '\\"a', "ä")
vim.keymap.set("i", "\\ss", "ß")
vim.keymap.set("i", '\\"O', "Ö")
vim.keymap.set("i", '\\"U', "Ü")
vim.keymap.set("i", '\\"A', "Ä")

local function set_language_config()
    local filetype = vim.bo.filetype
    if filetype == "python" then
        vim.opt.tabstop = 4
        vim.opt.shiftwidth = 4
        vim.opt.softtabstop = 4
        vim.opt.expandtab = true
    elseif (
        filetype == "javascript"
        or filetype == "javascriptreact"
        or filetype == "typescript"
        or filetype == "typescriptreact"
        or filetype == "yaml"
	) then
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
        vim.opt.expandtab = true
    end
end

vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"*"},
  callback = function()
    set_language_config()
  end
})

vim.g.home = os.getenv("HOME") .. "/"
vim.g.modulesPath = vim.g.home .. "lconfig/nvim/modules/"
vim.g.pluginsPath = vim.g.home .. "lconfig/nvim/plugins/"

dofile(vim.g.modulesPath .. "buffersAndTabs.lua")
dofile(vim.g.modulesPath .. "cpp.lua")
dofile(vim.g.modulesPath .. "tex.lua")
dofile(vim.g.modulesPath .. "json.lua")

dofile (vim.g.pluginsPath .. "plugins.lua")

-- This is set at the end, because of bugs of vim-plug!
vim.cmd("filetype plugin indent off")
