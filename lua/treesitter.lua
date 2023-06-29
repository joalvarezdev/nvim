local configs = require"nvim-treesitter.configs"

configs.setup {
  ensure_installed = {"lua", "json", "html", "yaml", "java", "python"},
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true }
}
