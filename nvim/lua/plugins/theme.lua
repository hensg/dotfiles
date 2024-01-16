return
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  }
  -- {
  --   "rainglow/vim",
  --   config = function()
  --     vim.cmd.colorscheme("bold-contrast")
  --   end,
  -- },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   config = function()
  --     vim.cmd.colorscheme("kanagawa")
  --   end,
  -- },
  -- { 'rose-pine/neovim',
  --   name = 'rose-pine',
  --   opts = {
  --   },
  --   config = function(_, opts)
  --     vim.cmd.colorscheme("rose-pine-dawn")
  --   end,
  -- }
  -- {
  --   "aktersnurra/no-clown-fiesta.nvim",
  --   opts = {
  --     transparent = false, -- Enable this to disable the bg color
  --     styles = {
  --       -- You can set any of the style values specified for `:h nvim_set_hl`
  --       comments = {},
  --       keywords = {},
  --       functions = {},
  --       variables = {},
  --       type = { bold = true },
  --       lsp = { underline = true },
  --     },
  --   },
  --   config = function(_, opts)
  --     vim.cmd.colorscheme("no-clown-fiesta")
  --   end,
  -- }
