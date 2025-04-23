return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "rust", "go", "lua", "python", "javascript", "html", "css" }, -- Add your languages
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = { enable = true },

        -- Enable Treesitter text objects
        textobjects = {
          select = {
            enable = true,
            lookahead = true,              -- Jump forward to text objects
            keymaps = {
              ["af"] = "@function.outer",  -- Around function
              ["if"] = "@function.inner",  -- Inside function
              ["ac"] = "@class.outer",     -- Around class
              ["ic"] = "@class.inner",     -- Inside class
              ["ia"] = "@parameter.inner", -- Inside argument
              ["aa"] = "@parameter.outer", -- Around argument
              ["ib"] = "@block.inner",     -- Inside block
              ["ab"] = "@block.outer",     -- Around block
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- Jump between objects
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
              ["]a"] = "@parameter.inner",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
              ["[a"] = "@parameter.inner",
            },
          },
        },
      }
    end
  },

  -- Add Treesitter textobjects
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      enable = true, -- Enable this plugin
      max_lines = 3, -- Maximum lines to show
      min_window_height = 10, -- Minimum window height before showing
      trim_scope = "inner", -- Show only the inner scope
      mode = "cursor", -- Show context at cursor (alternative: "topline")
      separator = "─", -- Line separator
    },
  },
}
