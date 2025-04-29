local border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

return {
  { "onsails/lspkind-nvim" }, -- Added for icons
  {
    'saghen/blink.cmp',
    dependencies = {
      "rafamadriz/friendly-snippets",
      "fang2hou/blink-copilot",
      "onsails/lspkind-nvim",
    },
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
          draw = {
            components = {
              kind_icon = {
                text = function(ctx)
                  local lspkind = require("lspkind")
                  lspkind.init({
                    symbol_map = {
                      Copilot = "",
                    },
                  })
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = lspkind.symbolic(ctx.kind, {
                      mode = "symbol",
                    })
                  end

                  return icon .. ctx.icon_gap
                end,

                -- Optionally, use the highlight groups from nvim-web-devicons
                -- You can also add the same function for `kind.highlight` if you want to
                -- keep the highlight groups in sync with the icons.
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              }
            }
          }
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
      sources = {
        default = { 'lsp', 'snippets', 'path', 'buffer' },
        -- providers = {
        --   copilot = {
        --     name = "copilot",
        --     module = "blink-copilot",
        --   },
        --   avante = {
        --     module = 'blink-cmp-avante',
        --     name = 'Avante',
        --     opts = {
        --       -- options for blink-cmp-avante
        --     }
        --   }
        -- },
      },
    },
    opts_extend = { "sources.default" }
  }
}
