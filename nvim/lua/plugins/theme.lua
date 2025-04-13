return {
  {
    "aktersnurra/no-clown-fiesta.nvim",
    priority = 1000,
    opts = {
      styles = {
        type = { bold = true },
        lsp = { underline = false },
        match_paren = { underline = true },
      },
    },
    config = function (_, opts)
      local plugin = require "no-clown-fiesta"
      plugin.setup(opts)
      return plugin.load()
    end,
    lazy = false,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function(_, opts)
      --       vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   config = function()
  --     -- vim.cmd.colorscheme("kanagawa")
  --   end,
  -- },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
    },
    config = function(_, _)
      -- vim.cmd.colorscheme("rose-pine-moon")
    end,
  },
  -- {
  --   'AlexvZyl/nordic.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --       require('nordic').load()
  --   end
  -- },
  {
    'projekt0n/github-nvim-theme',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({})
      --       vim.cmd('colorscheme github_dark_default')
    end,
  },
  -- {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end },
  --  {
  --    "xiantang/darcula-dark.nvim",
  --    dependencies = {
  --      "nvim-treesitter/nvim-treesitter",
  --    },
  --    config = function()
  --      vim.cmd.colorscheme('darcula-solid')
  --    end
  --  },
  -- {
  --   "briones-gabriel/darcula-solid.nvim",
  --   dependencies = { "rktjmp/lush.nvim" },
  --   config = function()
  --     vim.cmd.colorscheme('darcula-solid')
  --   end
  -- },
  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      --       vim.cmd.colorscheme('oxocarbon')
    end
  },
  { "sainnhe/everforest" },
  { "sainnhe/sonokai" },
  { "ellisonleao/gruvbox.nvim" },
  { "savq/melange-nvim" },
  { "alexvzyl/nordic.nvim" },
  { "cocopon/iceberg.vim" },
  {
    "jwbaldwin/oscura.nvim",
    config = function()
       vim.cmd.colorscheme("oscura")
    end
  },
  { 'luisiacc/gruvbox-baby' }
}
