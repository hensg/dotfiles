return {
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({})
    end,
  },
  --{
  --  "ellisonleao/gruvbox.nvim",
  --  priority = 1000,
  --  config = true,
  --  opts = {
  --    terminal_colors = true, -- add neovim terminal colors
  --    undercurl = true,
  --    underline = true,
  --    bold = false,
  --    italic = {
  --      strings = true,
  --      emphasis = true,
  --      comments = true,
  --      operators = false,
  --      folds = true,
  --    },
  --    strikethrough = true,
  --    invert_selection = false,
  --    invert_signs = false,
  --    invert_tabline = false,
  --    inverse = true, -- invert background for search, diffs, statuslines and errors
  --    contrast = "", -- can be "hard", "soft" or empty string
  --    palette_overrides = {},
  --    overrides = {},
  --    dim_inactive = false,
  --    transparent_mode = false,
  --  }
  --},
  {
    'morhetz/gruvbox',
    config = function()
      vim.g.gruvbox_invert_selection = 0
      vim.g.gruvbox_contrast_dark = 'hard'
      vim.g.gruvbox_italicize_comments = 1
      vim.g.gruvbox_italic = 1
      vim.g.gruvbox_bold = 0
      vim.g.gruvbox_hls_cursor = nil

      --   vim.api.nvim_set_hl(0, 'DiffAdd', { fg = '#1D2021', bg = '#B8BB26' })
      --   vim.api.nvim_set_hl(0, 'DiffChange', { fg = '#1D2021', bg = '#FABD2F' })
      --   vim.api.nvim_set_hl(0, 'DiffDelete', { fg = '#1D2021', bg = '#FB4934' })
      --   vim.api.nvim_set_hl(0, 'DiffText', { fg = '#1D2021', bg = '#98971A' })
    end
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_enable_italic = false
      -- vim.cmd.colorscheme('gruvbox-material')
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "auto", -- latte, frappe, macchiato, mocha
        background = {    -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
        term_colors = true,             -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false,              -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15,            -- percentage of the shade to apply to the inactive window
        },
        no_italic = false,              -- Force no italic
        no_bold = false,                -- Force no bold
        no_underline = false,           -- Force no underline
        styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" },      -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
      })
    end
  },
  {
    "rebelot/kanagawa.nvim",
    config = function(_, opts)
      -- Default options:
      require('kanagawa').setup({
        compile = true,   -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,   -- do not set background color
        dimInactive = true,    -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {             -- add/modify theme and palette colors
          palette = {},
          theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {
              ui = {
                bg_gutter = "none"
              }
            }
          },
        },
        overrides = function(colors) -- add/modify highlights
          local theme = colors.theme
          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
        theme = "dragon",  -- Load "wave" theme
        background = {     -- map the value of 'background' option to a theme
          dark = "dragon", -- try "dragon" !
          light = "lotus"
        },
      })
    end
  }
}
