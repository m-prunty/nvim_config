local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local theme_ok, dash = pcall(require, "plugins.themes.potify")
if not theme_ok then
	return
end



vim.cmd([[
  highlight Type guifg=#ff79c6
  highlight Operator guifg=#8be9fd
  highlight Comment guifg=#6272a4
  highlight AlphaButton guifg=#ff79c6 gui=bold
  highlight AlphaHeader guifg=#8be9fd gui=italic
  highlight AlphaFooter guifg=#6272a4
]])

	alpha.setup(dash.config)
vim.cmd("redraw")

--[[
local function button(sc, txt, keybind, keybind_opts)
	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 2,
		width = 36,
		align_shortcut = "right",
		hl_shortcut = "Keyword",
	}

	if keybind then
		opts.keymap = { "n", sc, keybind, keybind_opts or { noremap = true, silent = true } }
	end

	local button = dash.button(sc, txt, keybind)
	button.opts = opts
	return button
end

--[[dash.section.buttons.val = {
	button("n", "📄  New File", ":enew<CR>"),
	button("f", "📂  Find File", ":Telescope find_files<CR>"),
	button("r", "🕰️  Recent Files", ":Telescope oldfiles<CR>"),
	button("l", "⚙️  Lazy Plugins", ":Lazy<CR>"),
	button("q", "🚪 Quit Neovim", ":qa<CR>"),
}


dash.opts.opts.noautocmd = true
local function popup_window()
	local width = math.floor(vim.o.columns * 0.7)
	local height = math.floor(vim.o.lines * 0.7)

	local opts = {
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2),
		col = math.floor((vim.o.columns - width) / 2),
		style = "minimal",
		border = "rounded",
	}

	local buf = vim.api.nvim_create_buf(false, true)
	win = vim.api.nvim_open_win(buf, true, opts)

	-- Apply Alpha's layout to the popup buffer
	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
	vim.api.nvim_buf_set_option(buf, "filetype", "alpha")
	vim.api.nvim_win_set_option(win, "winblend", 15)


	-- Automatically close popup with `q`
	vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>q<CR>", { noremap = true, silent = true })

	alpha.setup(dash.config)
	return win
end

--vim.api.nvim_create_autocmd("VimEnter", {
--	callback = popup_window,
--})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = popup_window,
})

-- Override the Alpha command to always create a popup window
vim.api.nvim_create_user_command("Alpha", popup_window, {})
popup_window()
]]
--[[ Function to create a popup window for alpha
local function create_alpha_popup()
  -- Set up the alpha layout
  local config = dash.config

  -- Open a floating window (popup)
  local width = 80
  local height = 20
			  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)  -- create a buffer for alpha screen
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, config.layout)  -- load alpha layout into the buffer

  -- Set window options
  local win_opts = {
	relative = "editor",
	width = width,
	height = height,
	col = col,
	row = row,
	style = "minimal",  -- Makes the window minimal (without borders)
	border = "rounded", -- Rounded corners for the window
  }

  -- Create a floating window with the alpha content
  local win = vim.api.nvim_open_win(buf, true, win_opts)

  -- Optionally, set a highlight for the window (background color, etc.)
  vim.api.nvim_win_set_option(win, "winhl", "Normal:Normal,FloatBorder:FloatBorder")
end
-- Call the function to display the popup when Neovim starts
create_alpha_popup()
]]




