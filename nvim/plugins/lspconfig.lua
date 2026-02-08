-- Set up language server.

-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md for
-- language servers for the programming languages you require
local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gsh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[[", "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]]", "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<cr>", opts)

    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = bufnr,
      callback = function()
        local opts = {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = 'rounded',
          source = 'always',
          prefix = ' ',
          scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
      end
    })
end

--[[
Basic config

vim.lsp.config("<language server>", {
    on_attach = on_attach,
    capabilities = capabilities,
})
vim.lsp.enable("<language server>")

]]

--[[
Install pyright with
```
pip install pyright
```
]]
vim.lsp.config("pyright", {
    on_attach = on_attach,
    capabilities = capabilities,
})
vim.lsp.enable("pyright")

vim.lsp.config("ccls", {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "ccls" },
    init_options = {
        cache = {
            directory = ".ccls-cache",
        },
        filetypes =  {"c", "cc", "cpp", "objc", "objcpp", "cuda" },
        compilationDatabaseDirectory = "./build/",
        index = {
            threads = 0,
        },
        clang = {
            excludeArgs = { "-frounding-math"} ,
        },
    },
})
vim.lsp.enable("ccls")

vim.lsp.config("jdtls", {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "jdtls",
        "-configuration",
        "/home/mike0609king/.cache/jdtls/config",
        "-data",
        "/home/mike0609king/.cache/jdtls/workspace"
    },
    filetypes = { "java" },
    {
        jvm_args = {},
        workspace = "/home/user/.cache/jdtls/workspace"
    },
    single_file_support = true,
})
vim.lsp.enable("jdtls")

--[[
Setup for web (ts, js, json,)

Install typescript language server
```
sudo npm install -g typescript typescript-language-server
```
]]
vim.lsp.config("ts_ls", {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }

})
vim.lsp.enable("ts_ls")
