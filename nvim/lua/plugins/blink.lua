local border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    "rafamadriz/friendly-snippets",
    -- { "fang2hou/blink-copilot" },
  },
  -- use a release tag to download pre-built binaries
  version = '1.*',
  opts = {
    enabled = function()
      local buf_type = vim.bo.filetype
      return not vim.tbl_contains({ "AvantePromptInput", "AvanteInput", "markdown" }, buf_type)
    end,
    cmdline = { enabled = false },
    keymap = {
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-b>"] = {
        function(cmp)
          cmp.scroll_documentation_up(4)
        end,
      },
      ["<C-f>"] = {
        function(cmp)
          cmp.scroll_documentation_down(4)
        end,
      },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      menu = {
        auto_show = true,
        border = border_chars,
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        window = {
          border = border_chars,
        },
      },
      list = { selection = { preselect = false, auto_insert = true } },
    },
    signature = {
      enabled = true,
      window = { border = border_chars },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'avante', 'lsp', 'snippets', 'path', 'buffer' },
      providers = {
        avante = {
          module = 'blink-cmp-avante',
          name = 'Avante',
          opts = {
            -- options for blink-cmp-avante
          }
        }
      },
      -- providers = {
      --   copilot = {
      --     name = "copilot",
      --     module = "blink-copilot",
      --     score_offset = 100,
      --     async = true,
      --     opts = {
      --       max_completions = 1,
      --       max_attempts = 2,
      --     }
      --   },
      -- },
    },
  },
  opts_extend = { "sources.default" }
}
