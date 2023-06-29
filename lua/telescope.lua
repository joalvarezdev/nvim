
map_key("n", "<C-p>", ":lua require'telescope.builtin'.find_files()<CR>")
map_key("n", "<leader>fs", ":lua require'telescope.builtin'.live_grep()<CR>")
map_key("n", "<leader>fh", ":lua require'telescope.builtin'.help_tags()<CR>")
map_key("n", "<leader>fb", ":lua require'telescope.builtin'.buffers()<CR>")

map_key("n", "gst", ":Telescope git_status<CR>")
map_key("n", "gb", ":Telescope git_branches<CR>")
map_key("n", "gstl", ":Telescope git_stash<CR>")
map_key("n", "glog", ":Telescope git_commits<CR>")

map_key("n", "gp", ":Git push<CR>")

