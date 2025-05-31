local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use { "nvim-neotest/nvim-nio" }
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use ({'nvim-treesitter/nvim-treesitter', {run = ':TSUpdateSync'}})
  use 'nvim-lualine/lualine.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'christoomey/vim-tmux-navigator'

  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'

--   use {
--     'VonHeikemen/lsp-zero.nvim',
--     branch = 'v1.x',
--     requires = {
--       -- LSP Support
--     --   {'neovim/nvim-lspconfig'},
--       {'williamboman/mason.nvim'},
--       {'williamboman/mason-lspconfig.nvim'},

--       -- Autocompletion
--       {'hrsh7th/nvim-cmp'},
--       {'hrsh7th/cmp-buffer'},
--       {'hrsh7th/cmp-path'},
--       {'saadparwaiz1/cmp_luasnip'},
--     --   {'hrsh7th/cmp-nvim-lsp'},
--     --   {'hrsh7th/cmp-nvim-lua'},

--       -- Snippets
--       {'L3MON4D3/LuaSnip'},
--       {'rafamadriz/friendly-snippets'},
--     }
--   }
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-dap-python'


  -- tab management
  use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

--   use 'airblade/vim-gitgutter'
  use 'chentoast/marks.nvim'

  -- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
