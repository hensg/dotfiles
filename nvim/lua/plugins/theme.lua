return {
  {
    'morhetz/gruvbox',
    config = function()
      vim.g.gruvbox_bold = 0
      -- vim.g.gruvbox_contrast_dark = 'dark'
      vim.g.gruvbox_italicize_comments = 1
      vim.g.gruvbox_italic = 1
      vim.cmd.colorscheme("gruvbox")
    end
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_contrast_dark = 'hard'
      vim.g.gruvbox_material_enable_italic = true
      -- vim.cmd.colorscheme('gruvbox-material')
    end
  },
  -- {
  --   name     = "sand",
  --   dir      = vim.fn.stdpath('config'),    -- points at ~/.config/nvim
  --   lazy     = false,                        -- load immediately
  --   priority = 1000,                         -- load before everything else
  --   config   = function()
  --     vim.opt.termguicolors = true
  --     vim.cmd('colorscheme sand')
  --   end,
  -- },
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
      -- vim.cmd("colorscheme kanagawa")
    end
  }
}
