local map = vim.keymap.set

vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_force_echo_notifications = 1
-- vim.g.db_ui_hide_schemas = 'information_schema'
-- , 'pg_catalog', 'pg_toast', 'pg_toast_temp_1'

vim.g.db_ui_icons = {
    expanded = {
        db = '▾ ',
        buffers = '▾ ',
        saved_queries = '▾ ',
        schemas = '▾ ',
        schema = '▾ פּ',
        tables = '▾ 藺',
        table = '▾ ',
    },
    collapsed = {
        db = '▸ ',
        buffers = '▸ ',
        saved_queries = '▸ ',
        schemas = '▸ ',
        schema = '▸ פּ',
        tables = '▸ 藺',
        table = '▸ ',
    },
    saved_query = '',
    new_query = '璘',
    tables = '離',
    buffers = '',
    add_connection = '',
    connection_ok = '✓',
    connection_error = '✕',
}

map("n", "<leader>ad", ":tab DBUI<CR>", {})
map("n", "<A-4>", ":DBUIToggle<CR>", {})
map("v", "<A-e>", ":DBUI_ExecuteQuery<CR>", {})

-- vim.keymap.set("n", "<leader>bd", ":tab DBUI<CR>", {})

vim.cmd([[
autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
]])
