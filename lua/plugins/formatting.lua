local conform = require("conform")
conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = function(bufnr)
      if require("conform").get_formatter_info("ruff_format", bufnr).available then
        return { "ruff_format" }
      else
        return {  "black" }
      end
    end,
    ["*"] = {"codespell"}
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
  format_after_save = {
    lsp_fallback = true,
  },
})

vim.keymap.set({ "n", "v"}, "<leader>mp", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end)
