--return {
--  "zk-org/zk-nvim",
--  require("zk").setup()
--}

local zk = require("zk")

zk.setup({
  picker = "telescope", -- or "fzf-lua" if you prefer
})

local commands = require("zk.commands")

commands.add("ZkNew", function(options)
  options = vim.tbl_extend("force", options or {}, { dir = vim.fn.getcwd() })
  zk.new(options)
end)
