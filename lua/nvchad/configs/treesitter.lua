pcall(function()
	dofile(vim.g.base46_cache .. "syntax")
	dofile(vim.g.base46_cache .. "treesitter")
end)

return {
	ensure_installed = { "lua", "c","make", "bash","python", "luadoc", "printf", "vim", "vimdoc", "markdown",  },
	auto_install = true,
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn", -- set to `false` to disable one of the mappings
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},

	indent = { enable = true },
}
