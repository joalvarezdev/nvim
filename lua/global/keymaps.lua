local map = vim.keymap.set
-- Leader
vim.g.mapleader = " "

map("n", "<leader>rr", ":source %<CR>", { desc = "Reload configuration" })

-- tabulation
map("v", "<", "<gv", { desc = "Indent out and keep the selection" })
map("v", ">", ">gv", { desc = "Indent in and keep the selection" })

-- search resul focus
map("n", "n", "nzzzv", { desc = "Goes to next result on the search and put the cursor in the middle of the screen" })
map("n", "N", "Nzzzv", { desc = "Goes to prev result on the search and put the cursor in the middle of the screen" })


-- map_key('n', '<leader>so', ':source %<CR>')

map('i', 'jk', '<ESC>')
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>q', ':q!<CR>')
map('n', '<leader>e', ':wq<CR>')


map("n", "<A-h>", ":wincmd h<CR>")
map("n", "<A-l>", ":wincmd l<CR>")
map("n", "<A-j>", ":wincmd j<CR>")
map("n", "<A-k>", ":wincmd k<CR>")

-- TABS

map("n", "<A-a>", ":tabprevious<CR>") 
map("n", "<A-d>", ":tabnext<CR>") 

-- MARKDOWN PREVIEW

map("n", "<leader>md", ":MarkdownPreview<CR>")
map("n", "<leader>mds", ":MarkdownPreviewStop<CR>")

