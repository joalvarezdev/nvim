local packer = require "packer"
local util = require "packer.util"

packer.init({
  package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack")
})


--if fn.empty(fn.glob(install_path)) > 0 then
	--packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packa})
--end

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
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path", "L3MON4D3/LuaSnip"
    }
  }

  use "williamboman/mason.nvim"
  use "mfussenegger/nvim-jdtls"


  use {
    "kristijanhusak/vim-packager",
    requires = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-ui",
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
end)

--packer.startup(function(use)

  --use "lukas-reineke/indent-blankline.nvim" use "tpope/vim-commentary"



  --use "mfussenegger/nvim-dap"
  --use "rcarriga/cmp-dap"


  --use "tpope/vim-fugitive"
  --use "lewis6991/gitsigns.nvim"
--
