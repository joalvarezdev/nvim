local cmp = require("cmp")
local luasnip = require("luasnip")

local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },

  sources = {
    {name = "path"},
    {name = "nvim_lsp"},
    {name = "buffer", keyword_length = 3},
    {name = "luasnip", keyword_length = 2},
  },

  window = {
    documentation = cmp.config.window.bordered()
  },

  formatting = {
    fields = {"menu", "abbr", "kind"},
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = "[LSP]",
        luasnip = "[SNIP]",
        buffer = "[BUF]",
        path = "[PATH]",
      }
      item.menu = menu_icon[entry.source.name]
      return item
    end
  },

  mapping = {
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({select = false}),
    ["<A-j>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item(select_opts)
        else
          fallback()
        end
    end, {"i", "s"}),
    ["<A-k>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {"i", "s"}),
    ["<C-;>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.mapping.scroll_docs(4)
      else
        fallback()
      end
    end, {"i", "s"}),
    ["<C-.>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.mapping.scroll_docs(-4)
      else
        fallback()
      end
    end, {"i", "s"})
  }
})

-- Completion in dap repl
cmp.setup({
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
      or require("cmp_dap").is_dap_buffer()
  end
})

cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = {
    { name = "dap"},
  },
})

