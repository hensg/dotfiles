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
        i = { ["<c-q>"] = require("trouble.providers.telescope").open_with_trouble },
        n = { ["<c-q>"] = require("trouble.providers.telescope").open_with_trouble },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
  end,
}
