
-- Leader
vim.g.mapleader = " "

map_key('n', '<leader>so', ':source %<CR>')

map_key('i', 'jk', '<ESC>')
map_key('n', '<leader>w', ':w<CR>')
map_key('n', '<leader>q', ':q!<CR>')
map_key('n', '<leader>e', ':wq<CR>')


map_key("n", "<A-h>", ":wincmd h<CR>")
map_key("n", "<A-l>", ":wincmd l<CR>")
map_key("n", "<A-j>", ":wincmd j<CR>")
map_key("n", "<A-k>", ":wincmd k<CR>")

-- TABS

map_key("n", "<A-a>", ":tabprevious<CR>") 
map_key("n", "<A-d>", ":tabnext<CR>") 

-- MARKDOWN PREVIEW

map_key("n", "<leader>md", ":MarkdownPreview<CR>")
map_key("n", "<leader>mds", ":MarkdownPreviewStop<CR>")

