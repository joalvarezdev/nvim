local packer = require "packer"
local util = require "packer.util"

packer.init({
  package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack")
})

packer.startup(function(use)
  use "wbthomason/packer.nvim"
  -- Themes
  use "ellisonleao/gruvbox.nvim"
  use "AstroNvim/astrotheme"
  use "nvim-treesitter/nvim-treesitter"

  use "nvim-tree/nvim-web-devicons"
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use "windwp/nvim-autopairs"

  use "romgrk/barbar.nvim"

  use "nvim-lualine/lualine.nvim"
 
  -- Telescope
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/telescope.nvim"
  use "jremmen/vim-ripgrep"

  use "neovim/nvim-lspconfig"

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path", 
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-git",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
      {"L3MON4D3/LuaSnip", version = "v1.*" },
      "windwp/nvim-autopairs"
    }
  }

  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "WhoIsSethDaniel/mason-tool-installer"

  use "mfussenegger/nvim-jdtls"


  use {
    "kristijanhusak/vim-packager",
    requires = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
      "tpope/vim-dotenv"
    }
  }

  use {
    "rest-nvim/rest.nvim",
    requires = {
      "nvim-lua/plenary.nvim"
    }
  }

  use{
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  }

  use "mfussenegger/nvim-dap"
  use "rcarriga/cmp-dap"

  use {"catppuccin/nvim", as = "catppuccin"}

  use "stevearc/conform.nvim"

end)
