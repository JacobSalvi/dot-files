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

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use("doums/darcula")
  use("rebelot/kanagawa.nvim")
  use("christoomey/vim-tmux-navigator")
  use("nvim-lualine/lualine.nvim")
  use("nvim-tree/nvim-web-devicons")
  use("nvim-tree/nvim-tree.lua")
  use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

 -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets
  
  -- lsp
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use("onsails/lspkind.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("jayp0521/mason-null-ls.nvim")
  use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
          require("nvim-treesitter.install").update({with_sync = true})
      end
  })

  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
  
  use("lewis6991/gitsigns.nvim")
  use("pocco81/auto-save.nvim")    
  use("hiphish/rainbow-delimiters.nvim")
  use("mrcjkb/rustaceanvim")
  use('mfussenegger/nvim-dap')
    use({'rcarriga/nvim-dap-ui', requires = {"nvim-neotest/nvim-nio"}})
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
     require("toggleterm").setup()
    end}
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
