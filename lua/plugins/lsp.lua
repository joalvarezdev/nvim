local map = vim.keymap.set

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set("n", "<leader>gi", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
end

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  filetypes = {"python"}
})

lspconfig.tsserver.setup({
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
})



map("n", "<leader>ma", ":Mason<CR>")
