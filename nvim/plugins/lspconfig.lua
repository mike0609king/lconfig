-- Set up lspconfig.
-- 
-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md for
-- language servers for the programming languages you require
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gsh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[[", "<cmd>lua vim.diagnostic.enable()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]]", "<cmd>lua vim.diagnostic.disable()<cr>", opts)
end

--[[
Basic config

require("lspconfig")["<language server>"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

]]

require("lspconfig").pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").ccls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "ccls" },
    init_options = {
        cache = {
          directory = ".ccls-cache";
        },
        filetypes =  {"c", "cpp", "objc", "objcpp", "cuda" },
        compilationDatabaseDirectory = "./build/",
        index = {
            threads = 0,
        },
        clang = {
            excludeArgs = { "-frounding-math"} ,
        },
    },
}

require'lspconfig'.jdtls.setup{
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
}
