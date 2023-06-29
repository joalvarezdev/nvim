
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

function get_spring_boot_runner(profile, debug)
  local debug_param = ""
  if debug then
    debug_param = "-Dspring-boot.run.jvmArguments='-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005'"
  end

  local profile_param = ""
  if profile then
    profile_param = "-Dspring-boot.run.profiles=" .. profile .. " "
  end

  return "mvn spring-boot:run " .. profile_param .. debug_param
end

function run_spring_boot(debug)
  vim.cmd("term " .. get_spring_boot_runner("local", debug))
end

vim.keymap.set("n", "<leader>rc", function() run_spring_boot() end)
vim.keymap.set("n", "<leader>dd", function() run_spring_boot(true) end)

function attach_to_debug()
  local dap = require("dap")
  dap.configurations.java = {
    {
      type = "server";
      request = "attach";
      name = "Attach to the process";
      hostName = "localhost";
      port = "5005";
    },
  }
  dap.adapters.java = {}
  dap.continue()
end

map_key("n", "<leader>da", ":lua attach_to_debug()<CR>")

map_key("n", "<C-A-k>", ":lua require'dap'.continue()<CR>")
map_key("n", "<C-A-l>", ":lua require'dap'.step_into()<CR>")
map_key("n", "<C-A-p>", ":lua require'dap'.step_over()<CR>")

map_key("n", "<leader>bp", ":lua require'dap'.toggle_breakpoint()<CR>")

-- MARKDOWN PREVIEW

map_key("n", "<leader>md", ":MarkdownPreview<CR>")
map_key("n", "<leader>mds", ":MarkdownPreviewStop<CR>")
