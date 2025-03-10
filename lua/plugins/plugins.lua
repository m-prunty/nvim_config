local plugins = {
	{ "itchyny/calendar.vim",
		lazy =  false
	},
	{
		"mbbill/undotree",
		lazy = false,
		config = function()
			require "plugins.configs.undotree"
			--require("undotree").setup(opts)
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		opts = function()
			return require "plugins.configs.null-ls"
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require "configs.lspconfig"
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"clang-format",
				"codelldb",
			},
		},
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "echasnovski/mini.icons" },
		config = function()
			require "plugins.configs.alpha"
		end,
		event = "VimEnter",
	},
	{
		"zk-org/zk-nvim",
		--event = "Lazy"
		--lazy = false,
		init = function()
			require("zk").setup {
				-- See Setup section below
			}
		end,
	},
	{ "nvim-neotest/nvim-nio" },
	{
		"mfussenegger/nvim-dap",
		lazy = false, -- We need DAP to load immediately
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap.ui")
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			ensure_installed = { "codelldb", "gdb" },
			handlers = {},
		}
	},
--[[	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	]]
	{ 
		"jannis-baum/vivify.vim",
		lazy = false
	},
	{
		'abeleinin/papyrus',
		lazy = false
	},
	{
		'vim-pandoc/vim-pandoc',
		lazy = false
	},
	{
		"ojroques/nvim-bufdel",
		lazy = false,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		init = function()
			require("plugins.configs.vim-tmux-navigator")
		end,
	}

}
return plugins
