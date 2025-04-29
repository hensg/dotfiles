return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      shell = vim.o.shell .. " -i", -- <-- Force interactive shell
      direction = "horizontal",
      size = 15,
      open_mapping = [[<C-t>]],
      shading_factor = 2,
    })
  end,
}
