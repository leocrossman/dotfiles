local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use({
    'luisiacc/gruvbox-baby',
    as = 'gruvbox-baby',
    config = function()
      vim.cmd('colorscheme gruvbox-baby')
    end
  })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use 'nvim-treesitter/playground'

  use 'theprimeagen/harpoon'

  use 'mbbill/undotree'

  use 'tpope/vim-fugitive'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' }, -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' }, -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
  }


  -- LSP > CoC
  -- use('neoclide/coc.nvim', {branch = 'release'})

  use 'preservim/nerdtree'

  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }

  use 'sbdchd/neoformat'

  use 'qxxxb/vim-searchhi'
  use 'haya14busa/vim-asterisk'

  use 'preservim/nerdcommenter'

  -- Code spellcheck
  use 'kamykn/spelunker.vim'

  use 'justinmk/vim-sneak'

  -- Themes
  use 'sickill/vim-monokai'
  use 'ackyshake/Spacegray.vim'


  use 'itchyny/lightline.vim'
  use 'edkolev/tmuxline.vim'

  use 'chrisbra/csv.vim'

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- Rust
  use 'simrat39/rust-tools.nvim' -- also 'neovim/nvim-lspconfig'
  use 'mfussenegger/nvim-dap' -- debugging - also plenary.nvim







  -- Automatically set up configuration after cloning packer.nvim
  -- Keep this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
