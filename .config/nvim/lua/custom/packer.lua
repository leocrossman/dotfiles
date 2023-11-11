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
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  -- use 'nvim-treesitter/playground'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' },             -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
  }

  use { 'jose-elias-alvarez/null-ls.nvim', requires = { { 'VonHeikemen/lsp-zero.nvim' }, { 'nvim-lua/plenary.nvim' } } }

  use { 'MunifTanjim/eslint.nvim', requires = { { 'jose-elias-alvarez/null-ls.nvim' }, { 'VonHeikemen/lsp-zero.nvim' },
    { 'nvim-lua/plenary.nvim' } } }

  use('neovim/nvim-lspconfig')
  use { 'MunifTanjim/prettier.nvim', requires = { { 'jose-elias-alvarez/null-ls.nvim' }, { 'VonHeikemen/lsp-zero.nvim' } } }

  -- use({
  -- 'luisiacc/gruvbox-baby',
  -- as = 'gruvbox-baby',
  -- config = function()
  -- vim.cmd('colorscheme gruvbox-baby')
  -- end
  -- })

  use { "ellisonleao/gruvbox.nvim" }


  -- use 'theprimeagen/harpoon'

  use 'mbbill/undotree'

  use 'tpope/vim-fugitive'



  -- LSP > CoC
  -- use('neoclide/coc.nvim', {branch = 'release'})

  -- from vim
  -- use 'preservim/nerdtree'
  -- use { 'Xuyuanp/nerdtree-git-plugin', requires = { 'preservim/nerdtree' } }
  -- nvim alternative:
  use { 'nvim-tree/nvim-tree.lua' }

  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }

  -- use 'sbdchd/neoformat'

  use 'qxxxb/vim-searchhi'
  use 'haya14busa/vim-asterisk'

  use 'preservim/nerdcommenter'

  -- Code spellcheck
  use 'kamykn/spelunker.vim'

  use 'justinmk/vim-sneak'

  -- Themes
  use 'sickill/vim-monokai'
  -- use 'ackyshake/Spacegray.vim'


  -- use 'itchyny/lightline.vim'

  use 'chrisbra/csv.vim'

  -- Rust
  use 'simrat39/rust-tools.nvim' -- also 'neovim/nvim-lspconfig'
  use 'mfussenegger/nvim-dap'    -- debugging - also plenary.nvim

  -- **Set VimDevIcons to load after these plugins!**
  -- NERDTree [1] | vim-airline [2] | CtrlP [3] | powerline [4] | Denite [5] | unite
  -- [6] | lightline.vim [7] | vim-startify [8] | vimfiler [9] | flagship [11]
  -- use 'ryanoasis/vim-devicons'
  use 'nvim-tree/nvim-web-devicons'


  -- Vim + Tmux status bars
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'edkolev/tmuxline.vim'


  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  -- display nerdicons in nvim
  use({ 'glepnir/nerdicons.nvim', cmd = 'NerdIcons', config = function() require('nerdicons').setup({}) end })


  -- Automatically set up configuration after cloning packer.nvim
  -- Keep this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
