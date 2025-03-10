require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<leader>w", "<cmd> w <cr>")

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", {desc = "TmuxNavi"})
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", {desc = "TmuxNavi"})
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", {desc = "TmuxNavi"})
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", {desc = "TmuxNavi"})
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", {desc = "TmuxNavi"})


map({"n", "i", "v"}, "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle Undo Tree" }) 
map({"n", "i", "v"}, "<C-a>", "<cmd>Alpha<CR>", { desc = "Toggle dashboard" })

--local dap = require("dap")
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" }) 
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue the debugger" }) 
map("n", "<F5>", "<cmd> DapContinue <CR>", { desc = "Start/Continue Debugging" })
map("n", "<F10>", "<cmd> DapStepOver <CR>", { desc = "Step Over"})
map("n", "<F11>", "<cmd> DapStepInto <CR>", { desc = "Step Into"})
map("n", "<F12>", "<cmd> DapStepOut <CR>", { desc = "Step Out"})
--map("n", "<Leader>bp", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle Breakpoint"})
--map("n", "<Leader>dr", "<cmd> DapRepl.open <CR>", { desc = "Open REPL" })Into


map("n", "<Leader>zn", ":ZkNew<CR>", { desc = "New Zettel" })
map("n", "<Leader>zf", ":ZkNotes<CR>", { desc = "Find Notes" })
map("n", "<Leader>zt", ":ZkTags<CR>", { desc = "Find Tags" })


map("n", "<leader>pc", ":PapyrusCompile<CR>", { desc = "PapyrusCompile"})
map("n", "<leader>pa", ":PapyrusAutoCompile<CR>", { desc = ":PapyrusAutoCompile"})
map("n", "<leader>pv", ":PapyrusView<CR>", { desc = ":PapyrusView"})
map("n", "<leader>ps", ":PapyrusStart<CR>", { desc = ":PapyrusStart"})
