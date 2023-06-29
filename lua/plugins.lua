local packer = require"packer"
local util = require"packer.util"

packer.init({
  package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack")
})
packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-treesitter/nvim-treesitter"

  use "lukas-reineke/indent-blankline.nvim" use "tpope/vim-commentary"
  use "windwp/nvim-autopairs"
  use "max397574/better-escape.nvim"

  use "nvim-tree/nvim-web-devicons"
  use "romgrk/barbar.nvim"

  -- Themes
  use "ellisonleao/gruvbox.nvim"
  use "AstroNvim/astrotheme"

  -- Telescope
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/telescope.nvim"
  use "jremmen/vim-ripgrep"

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use "neovim/nvim-lspconfig"

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path", "L3MON4D3/LuaSnip"
    }
  }

  use "williamboman/mason.nvim"
  use "mfussenegger/nvim-jdtls"

  use "mfussenegger/nvim-dap"
  use "rcarriga/cmp-dap"
  
  use "nvim-lualine/lualine.nvim"

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

  use {
    "kristijanhusak/vim-packager",
    requires = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-ui",
    }
  }

  use "tpope/vim-fugitive"
  use "lewis6991/gitsigns.nvim"

  end
)
