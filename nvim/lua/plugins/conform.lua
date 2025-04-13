return -- conform.nvim: Formatting configuration
{
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        rust = { "rustfmt" },
        lua = { "stylua" },
        python = { "pylsp" },
        -- nix = { "nixfmt" },
        yaml = { "prettier" },
        go = { "gofmt" },
      },
    })

    -- Uncomment if you want format-on-save
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   callback = function()
    --     require("conform").format()
    --   end,
    -- })
  end,
}
