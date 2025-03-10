local dapui = require("dapui")

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<Tab>" },
    open = "o",
  },
  layouts = {
    {
      elements = { "scopes", "stacks", "watches" },
      size = 40,
      position = "left",
    },
    {
      elements = { "repl", "console" },
      size = 10,
      position = "bottom",
    },
  },
})

-- Automatically open DAP UI on debug start
local dap = require("dap")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end




--[[
local dap, dapui = require("dap"), require("dapui")

-- open / close ui windows automatically
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end]]
