return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local on_attach = function(client, bufnr)
      -- if client.server_capabilities.documentHighlightProvider then
      --   vim.api.nvim_create_autocmd("CursorHold", {
      --     buffer = bufnr,
      --     callback = vim.lsp.buf.document_highlight,
      --   })
      -- end
    end

    -- Configure various LSP servers
    lspconfig.nixd.setup { capabilities = capabilities, on_attach = on_attach }

    lspconfig.rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          imports = {
            granularity = { group = "module" },
            prefix = "self",
          },
          cargo = {
            buildScripts = { enable = true },
          },
          procMacro = { enable = true },
          checkOnSave = { command = "clippy" },
        },
      },
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })

    -- Optional language servers
    lspconfig.denols.setup({ capabilities = capabilities, on_attach = on_attach })
    lspconfig.pylsp.setup({ capabilities = capabilities, on_attach = on_attach })
    lspconfig.ruff.setup({ capabilities = capabilities, on_attach = on_attach })
    lspconfig.gopls.setup({ capabilities = capabilities, on_attach = on_attach })
    lspconfig.yamlls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        yaml = {
          schemas = {
            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
            ["https://json.schemastore.org/github-action.json"] = "/.github/actions/*",
          },
        },
      },
    })
  end,
}
