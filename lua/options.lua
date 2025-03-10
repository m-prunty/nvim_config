require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local opt = vim.opt
local g = vim.g

-- MY OG configs
opt.autochdir = true
opt.guicursor = ""

opt.nu = true
--opt.relativenumber = true

opt.tabstop = 4 -- A TAB character looks like 4 spaces
opt.expandtab = false  -- Pressing the TAB key will insert spaces instead of a TAB character// 
-- opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true

--opt.wrap = true -- false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

--opt.updatetime = 50

opt.colorcolumn = "80"

--g.mapleader = " "

opt.showmatch = true

g.suda_smart_edit = 1

g.user42 = 'mprunty'
g.mail42 = 'mprunty@student.42london.com'

-- NVChad restarts here
g.calendar_google_token_path = "~/.cache/calendar.vim/"

local papyrus_template_dir = '$HOME/.local/share/nvim/lazy/papyrus/templates/latex/'
g.papyrus_latex_engine = 'xelatex'
g.papyrus_viewer = 'zathura'
--g.papyrus_template = papyrus_template_dir .. 'cv'
g.papyrus_template = 'cv'


g.tmux_navigator_save_on_switch = 2


-- Open binary files
vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = "*.pdf",
  callback = function()
    local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
    vim.cmd("silent !zathura " .. filename .. " &")
    vim.cmd("let tobedeleted = bufnr('%') | b# | exe \"bd! \" . tobedeleted")
  end
})

vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
  callback = function()
    local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
    vim.cmd("silent !eog " .. filename .. " &")
    vim.cmd("let tobedeleted = bufnr('%') | b# | exe \"bd! \" . tobedeleted")
  end
})
