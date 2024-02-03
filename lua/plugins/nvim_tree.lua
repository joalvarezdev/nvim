local map = vim.keymap.set

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    width = 25,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = false,
    ignore = true,
  }
})

map("n", "<A-2>", ":NvimTreeOpen<CR>")
map("n", "<A-3>", ":BufferLast<CR>")
map("n", "<A-1>", ":NvimTreeToggle<CR>")
