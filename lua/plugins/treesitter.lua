local configs = require"nvim-treesitter.configs"

configs.setup {
  ensure_installed = { "lua", "json", "html", "yaml", "java", "python", "javascript", "sql", "css"},
  sync_install = true,
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
  highlight = {
    enable = true
  },
  ligatures = {
    enable =true,
    disable = {}
  }
}
