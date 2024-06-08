return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "folke/trouble.nvim",
  },
  opts = {
    pickers = {
      colorscheme = {
        enable_preview = true,
      },
    },
    defaults = {
      mappings = {
        i = { ["<c-q>"] = require("trouble.sources.telescope").open },
        n = { ["<c-q>"] = require("trouble.sources.telescope").open },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
  end,
}
