-- ultisnips directory
vim.opt.runtimepath:append {"~/lconfig/nvim"}
vim.g.UltiSnipsJumpForwardTrigger='<Tab>'
vim.g.UltiSnipsJumpBackwardTrigger='<S-Tab>'

-- Set up nvim-cmp.
local cmp = require'cmp'

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

cmp.setup({
snippet = {
    expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
    end,
},
window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
    ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
}),
sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
    { name = 'nvim_lsp_signature_help' },
}, {
    { name = 'buffer' },
})
})
