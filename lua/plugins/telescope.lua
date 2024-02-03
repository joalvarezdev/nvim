local map = vim.keymap.set

map("n", "<C-p>", ":lua require'telescope.builtin'.find_files()<CR>")
map("n", "<leader>fs", ":lua require'telescope.builtin'.live_grep()<CR>")
map("n", "<leader>fh", ":lua require'telescope.builtin'.help_tags()<CR>")
map("n", "<leader>fb", ":lua require'telescope.builtin'.buffers()<CR>")

map("n", "gst", ":Telescope git_status<CR>")
map("n", "gb", ":Telescope git_branches<CR>")
map("n", "gstl", ":Telescope git_stash<CR>")
map("n", "glog", ":Telescope git_commits<CR>")

map("n", "gp", ":Git push<CR>")

