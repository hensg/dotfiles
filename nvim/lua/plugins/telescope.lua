return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
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
        i = { ["<c-t>"] = require("trouble.sources.telescope").open },
        n = { ["<c-t>"] = require("trouble.sources.telescope").open },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
  end,
}
