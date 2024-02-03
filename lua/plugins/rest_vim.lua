require("rest-nvim").setup({
  result_split_horizontal = false,
  result_split_in_place = false,
  skip_ssl_verification = false,

  highlight = {
    enabled = true,
    timeout = 150,
  },

  result = {
    show_url = true,
    show_http_info = true,
    show_headers = true,
    formatters = {
      json = "jq",
      html = function(body)
        return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
      end
    }
  },

  jump_to_request = false,
  env_file = ".env",
  custom_dinamic_variables = {},
  yank_dry_run = true,
})

map("n", "<leader>rr", ":lua require('rest-nvim').run()<CR>")
