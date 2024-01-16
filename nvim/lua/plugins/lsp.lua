return {
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
				javascript = { { "prettierd", "prettier" } },
				["*"] = { "codespell" },
				["_"] = { "trim_whitespace" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 2500,
				lsp_fallback = true,
			},
			format_after_save = {
				lsp_fallback = true,
			},
			notify_on_error = true,
			formatters = {
				black = {
					prepend_args = { "-line-length", "88" },
				},
			},
		},
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"stylua",
				"shfmt",
				"pyright",
				"flake8",
				"eslint",
				"json-lsp",
				"prettier",
				"black",
				"rust_analyser",
				"rustfmt",
			},
		},
	},

	{
		"ms-jpq/coq_nvim",
		branch = "coq",
	},
	{
		"ms-jpq/coq.artifacts",
		branch = "artifacts",
	},
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		version = false,
		config = function()
			local lsp = require("lspconfig")
			local coq = require("coq")
			coq.coq_settings = { auto_start = true }
			lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities())
			lsp.pyright.setup(coq.lsp_ensure_capabilities())
			lsp.eslint.setup(coq.lsp_ensure_capabilities())

			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- local servers =
			-- { "pyright", "lua_ls", "clangd", "rust_analyzer", "terraformls", "eslint", "jsonls" }
			-- local lspconfig = require("lspconfig")
			-- for _, lsp in ipairs(servers) do
			--   lspconfig[lsp].setup({
			--     capabilities = capabilities,
			--   })
			-- end
		end,
	},
}
