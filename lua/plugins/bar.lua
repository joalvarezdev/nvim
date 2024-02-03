local map = vim.keymap.set

map("n", "<C-j>", ":BufferPrevious<CR>")
map("n", "<C-k>", ":BufferNext<CR>")
map("n", "<A-e>", ":BufferClose<CR>")
