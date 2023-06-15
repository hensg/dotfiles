return {
  -- {
  --   "aktersnurra/no-clown-fiesta.nvim",
  --   config = function(_, opts)
  --     opts.transparent = false
  --     opts.styles = {
  --       type = { bold = true },
  --       lsp = { underline = true },
  --     }
  --     require("no-clown-fiesta").setup(opts)
  --     require("no-clown-fiesta").load()
  --   end,
  -- },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
    lazy = true,
  },
  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },
  -- asyncs
  { "nvim-lua/plenary.nvim" },
  -- better ui
  { "MunifTanjim/nui.nvim" },
  -- tree
  { "nvim-neo-tree/neo-tree.nvim" },
  -- better trobule
  { "folke/trouble.nvim" },
  -- highlight word
  { "RRethy/vim-illuminate" },
  -- lang highligh
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
    },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "python",
        "rust",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  { "nvim-treesitter/nvim-treesitter-context" },
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = { left = " ", right = " " },
        component_separators = { left = "", right = "" },
      },
    },
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = { open_mapping = "<C-t>" },
    config = function(_, opts)
      require("toggleterm").setup(opts)
    end,
  },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("catppuccin-mocha")
  --   end,
  -- },
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
  {
    "aktersnurra/no-clown-fiesta.nvim",
    opts = {
      transparent = false, -- Enable this to disable the bg color
      styles = {
        -- You can set any of the style values specified for `:h nvim_set_hl`
        comments = {},
        keywords = {},
        functions = {},
        variables = {},
        type = { bold = true },
        lsp = { underline = true },
      },
    },
    config = function(_, opts)
      vim.cmd.colorscheme("no-clown-fiesta")
    end,
  },
}
