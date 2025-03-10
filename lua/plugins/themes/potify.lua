local utils = require("alpha.utils")
local scaling_factor = 0.5  -- Change this to scale up or down

local if_nil = vim.F.if_nil
local fnamemodify = vim.fn.fnamemodify
local filereadable = vim.fn.filereadable

local function scale_header(header_val, scale_factor)
--	if scale_factor == 1 then
--		return header_val
--	end

	local scaled_header = {}
	local scale_horizontal = math.floor(scale_factor * 9) / 16
	local scale_vertical = math.floor(scale_factor * 10) / 10

	-- Scale vertically by repeating or skipping rows
	local row_index = 1
	while row_index <= #header_val do
		if scale_vertical >= 1 then
			-- Repeat rows for scaling up
			for _ = 1, scale_vertical do
				table.insert(scaled_header, header_val[row_index])
			end
		elseif row_index % math.floor(1 / scale_vertical) == 0 then
			-- Keep only selected rows for scaling down
			table.insert(scaled_header, header_val[row_index])
		end
		row_index = row_index + 1
	end

	-- Scale horizontally by adjusting each line's width
	if scale_horizontal ~= 1 then
		for i, line in ipairs(scaled_header) do
			local new_line = ""
			if scale_horizontal > 1 then
				-- Extend lines for scaling up
				for j = 1, #line do
					local char = line:sub(j, j)
					new_line = new_line .. string.rep(char, scale_horizontal)
				end
			else
				-- Compress lines for scaling down
				for j = 1, #line, math.floor(1 / scale_horizontal) do
					new_line = new_line .. line:sub(j, j)
				end
			end
			scaled_header[i] = new_line
		end
	end

	return scaled_header
end

-- Function to scale the header highlights
local function scale_header_highlights(highlights, scale_factor)
--	if scale_factor == 1 then
--		return highlights
--	end

	local scaled_highlights = {}
	local scale_horizontal = math.floor(scale_factor * 9) / 16

	for row, row_highlights in ipairs(highlights) do
		local new_row_highlights = {}

		for _, highlight in ipairs(row_highlights) do
			local hl_group = highlight[1]
			local start_col = highlight[2]
			local end_col = highlight[3]
			local new_start = math.floor(start_col * scale_horizontal)
			local new_end = math.floor(end_col * scale_horizontal)
			table.insert(new_row_highlights, { hl_group, new_start, new_end })
		end

		-- Add scaled highlights for each repeated row when scaling vertically
		if scale_factor >= 1 then
			for _ = 1, scale_factor do
				table.insert(scaled_highlights, new_row_highlights)
			end
		elseif row % math.floor(1 / scale_factor) == 0 then
			table.insert(scaled_highlights, new_row_highlights)
		end
	end

	return scaled_highlights
end

-- Usage example:
-- Add a scaling factor to your configuration


vim.api.nvim_set_hl(0, "Cff0000", { bg = "#ff0000" })
vim.api.nvim_set_hl(0, "Cd70000", { bg = "#d70000" })
vim.api.nvim_set_hl(0, "Caf0000", { bg = "#af0000" })
vim.api.nvim_set_hl(0, "C870000", { bg = "#870000" })
vim.api.nvim_set_hl(0, "C121212", { bg = "#121212" })
vim.api.nvim_set_hl(0, "C000000", {})
vim.api.nvim_set_hl(0, "C5f0000", { bg = "#5f0000" })
vim.api.nvim_set_hl(0, "C800000", { bg = "#800000" })
vim.api.nvim_set_hl(0, "C5f005f", { bg = "#5f005f" })
vim.api.nvim_set_hl(0, "C080808", { bg = "#080808" })
vim.api.nvim_set_hl(0, "C1c1c1c", { bg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "C000080", { bg = "#000080" })
vim.api.nvim_set_hl(0, "C00005f", { bg = "#00005f" })
vim.api.nvim_set_hl(0, "C000087", { bg = "#000087" })
vim.api.nvim_set_hl(0, "C0000af", { bg = "#0000af" })
vim.api.nvim_set_hl(0, "C0000d7", { bg = "#0000d7" })
vim.api.nvim_set_hl(0, "C0000ff", { bg = "#0000ff" })
vim.api.nvim_set_hl(0, "C262626", { bg = "#262626" })

local header = {
	type = 'text',
	val = scale_header({
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]],
		[[                                                                                                                                                                ]]
	}, scaling_factor),
	opts = {
		position = 'center',
		hl = scale_header_highlights({
				{ { "Cff0000", 0, 6 },  { "Cd70000", 6, 20 },  { "Caf0000", 20, 36 }, { "C870000", 36, 46 }, { "C121212", 46, 48 },  { "C000000", 48, 114 },  { "C5f0000", 114, 116 }, { "C870000", 116, 126 }, { "Caf0000", 126, 140 }, { "Cd70000", 140, 156 }, { "Cff0000", 156, 160 } },
				{ { "Cff0000", 0, 6 },  { "Cd70000", 6, 20 },  { "Caf0000", 20, 36 }, { "C870000", 36, 46 }, { "C800000", 46, 52 },  { "C5f005f", 52, 60 },   { "C000000", 60, 102 },  { "C5f005f", 102, 108 }, { "C800000", 108, 116 }, { "C870000", 116, 126 }, { "Caf0000", 126, 140 }, { "Cd70000", 140, 156 }, { "Cff0000", 156, 160 } },
				{ { "Cd70000", 0, 6 },  { "C000000", 6, 38 },  { "C5f0000", 38, 40 }, { "C870000", 40, 46 }, { "C800000", 46, 52 },  { "C5f005f", 52, 70 },   { "C080808", 70, 72 },   { "C000000", 72, 90 },   { "C1c1c1c", 90, 92 },   { "C5f005f", 92, 108 },  { "C800000", 108, 116 }, { "C870000", 116, 122 }, { "C5f0000", 122, 124 }, { "C000000", 124, 156 }, { "Cd70000", 156, 160 } },
				{ { "Cd70000", 0, 6 },  { "C000000", 6, 54 },  { "C5f0000", 54, 56 }, { "C5f005f", 56, 76 }, { "C000080", 76, 78 },  { "C00005f", 78, 80 },   { "C000000", 80, 82 },   { "C00005f", 82, 84 },   { "C5f005f", 84, 106 },  { "C121212", 106, 108 }, { "C000000", 108, 156 }, { "Cd70000", 156, 160 } },
				{ { "Cd70000", 0, 6 },  { "C000000", 6, 66 },  { "C5f005f", 66, 76 }, { "C000080", 76, 84 }, { "C000087", 84, 86 },  { "C5f005f", 86, 96 },   { "C000000", 96, 156 },  { "Cd70000", 156, 160 } },
				{ { "Caf0000", 0, 6 },  { "C000000", 6, 70 },  { "C000087", 70, 74 }, { "C5f005f", 74, 76 }, { "C000080", 76, 84 },  { "C000087", 84, 92 },   { "C000000", 92, 154 },  { "C080808", 154, 156 }, { "Caf0000", 156, 160 } },
				{ { "Caf0000", 0, 6 },  { "C5f0000", 6, 8 },   { "C000000", 8, 64 },  { "C0000af", 64, 68 }, { "C000087", 68, 78 },  { "C000080", 78, 80 },   { "C080808", 80, 82 },   { "C000080", 82, 84 },   { "C000087", 84, 92 },   { "C0000af", 92, 96 },   { "C000087", 96, 98 },   { "C000000", 98, 154 },  { "C870000", 154, 156 }, { "Caf0000", 156, 160 } },
				{ { "Caf0000", 0, 8 },  { "C000000", 8, 60 },  { "C0000af", 60, 68 }, { "C000087", 68, 74 }, { "C000000", 74, 86 },  { "C080808", 86, 88 },   { "C000087", 88, 92 },   { "C0000af", 92, 102 },  { "C000000", 102, 154 }, { "Caf0000", 154, 160 } },
				{ { "Caf0000", 0, 8 },  { "C000000", 8, 56 },  { "C0000af", 56, 68 }, { "C000087", 68, 70 }, { "C000000", 70, 92 },  { "C000087", 92, 94 },   { "C0000af", 94, 106 },  { "C000000", 106, 154 }, { "Caf0000", 154, 160 } },
				{ { "C870000", 0, 8 },  { "C000000", 8, 52 },  { "C0000af", 52, 64 }, { "C00005f", 64, 66 }, { "C000000", 66, 68 },  { "C121212", 68, 70 },   { "C0000af", 70, 72 },   { "C0000d7", 72, 74 },   { "C0000ff", 74, 88 },   { "C0000d7", 88, 90 },   { "C0000af", 90, 92 },   { "C080808", 92, 94 },   { "C000000", 94, 96 },   { "C000087", 96, 98 },   { "C0000af", 98, 110 },  { "C000000", 110, 152 }, { "C5f0000", 152, 154 }, { "C870000", 154, 160 } },

				{ { "C870000", 0, 10 }, { "C000000", 10, 48 }, { "C080808", 48, 50 }, { "C0000d7", 50, 54 }, { "C0000af", 54, 62 },  { "C0000d7", 62, 100 },  { "C0000af", 100, 108 }, { "C0000d7", 108, 112 }, { "C000000", 112, 152 }, { "C870000", 152, 160 } },
				{ { "C870000", 0, 2 },  { "C800000", 2, 4 },   { "C870000", 4, 10 },  { "C000000", 10, 46 }, { "C0000af", 46, 48 },  { "C0000d7", 48, 54 },   { "C0000af", 54, 58 },   { "C0000d7", 58, 104 },  { "C0000af", 104, 108 }, { "C0000d7", 108, 114 }, { "C000080", 114, 116 }, { "C000000", 116, 152 }, { "C870000", 152, 160 } },
				{ { "C000000", 0, 2 },  { "C800000", 2, 12 },  { "C000000", 12, 42 }, { "C0000d7", 42, 54 }, { "C0000af", 54, 56 },  { "C0000d7", 56, 60 },   { "C0000af", 60, 62 },   { "C000000", 62, 100 },  { "C0000af", 100, 102 }, { "C0000d7", 102, 106 }, { "C0000af", 106, 108 }, { "C0000d7", 108, 120 }, { "C000000", 120, 150 }, { "C800000", 150, 160 } },

				{ { "C000000", 0, 2 },  { "C5f0000", 2, 4 },   { "C5f005f", 4, 12 },  { "C000000", 12, 36 }, { "C0000af", 36, 38 },  { "C0000d7", 38, 52 },   { "C00005f", 52, 54 },   { "C000000", 54, 108 },  { "C0000af", 108, 110 }, { "C0000d7", 110, 124 }, { "C0000af", 124, 126 }, { "C000000", 126, 150 }, { "C5f005f", 150, 158 }, { "C080808", 158, 160 } },
				{ { "C000000", 0, 4 },  { "C5f005f", 4, 14 },  { "C000000", 14, 32 }, { "C0000af", 32, 40 }, { "C0000d7", 40, 50 },  { "C00005f", 50, 52 },   { "C000000", 52, 110 },  { "C0000af", 110, 112 }, { "C0000d7", 112, 122 }, { "C0000af", 122, 130 }, { "C000000", 130, 148 }, { "C5f005f", 148, 158 }, { "C000000", 158, 160 } },
				{ { "C000000", 0, 6 },  { "C5f005f", 6, 14 },  { "C262626", 14, 16 }, { "C000000", 16, 28 }, { "C0000af", 28, 40 },  { "C0000d7", 40, 48 },   { "C0000af", 48, 50 },   { "C000000", 50, 112 },  { "C0000d7", 112, 122 }, { "C0000af", 122, 134 }, { "C000000", 134, 146 }, { "C5f005f", 146, 156 }, { "C000000", 156, 160 } },
				{ { "C000000", 0, 6 },  { "C5f005f", 6, 16 },  { "C000000", 16, 24 }, { "C0000af", 24, 36 }, { "C00005f", 36, 38 },  { "C0000d7", 38, 48 },   { "C000000", 48, 114 },  { "C0000d7", 114, 124 }, { "C000087", 124, 126 }, { "C0000af", 126, 136 }, { "C000087", 136, 138 }, { "C000000", 138, 144 }, { "C1c1c1c", 144, 146 }, { "C5f005f", 146, 154 }, { "C121212", 154, 156 }, { "C000000", 156, 160 } },
				{ { "C000000", 0, 8 },  { "C5f005f", 8, 18 },  { "C000000", 18, 22 }, { "C000087", 22, 34 }, { "C000000", 34, 36 },  { "C121212", 36, 38 },   { "C0000d7", 38, 46 },   { "C121212", 46, 48 },   { "C000000", 48, 114 },  { "C0000af", 114, 116 }, { "C0000d7", 116, 124 }, { "C000000", 124, 128 }, { "C000087", 128, 140 }, { "C000000", 140, 144 }, { "C5f005f", 144, 154 }, { "C000000", 154, 160 } },
				{ { "C000000", 0, 10 }, { "C5f005f", 10, 18 }, { "C000087", 18, 30 }, { "C000000", 30, 36 }, { "C0000d7", 36, 46 },  { "C000000", 46, 116 },  { "C0000d7", 116, 124 }, { "C0000af", 124, 126 }, { "C000000", 126, 132 }, { "C000087", 132, 142 }, { "C000080", 142, 144 }, { "C5f005f", 144, 152 }, { "C000000", 152, 160 } },
				{ { "C000000", 0, 12 }, { "C000080", 12, 16 }, { "C000087", 16, 26 }, { "C00005f", 26, 28 }, { "C000000", 28, 36 },  { "C0000ff", 36, 38 },   { "C0000d7", 38, 46 },   { "C000000", 46, 116 },  { "C0000d7", 116, 126 }, { "C000000", 126, 134 }, { "C000080", 134, 136 }, { "C000087", 136, 146 }, { "C000080", 146, 150 }, { "C000000", 150, 160 } },
				{ { "C000000", 0, 14 }, { "C000080", 14, 24 }, { "C080808", 24, 26 }, { "C000000", 26, 36 }, { "C0000ff", 36, 38 },  { "C0000d7", 38, 46 },   { "C000000", 46, 116 },  { "C0000d7", 116, 124 }, { "C0000ff", 124, 126 }, { "C000000", 126, 136 }, { "C00005f", 136, 138 }, { "C000080", 138, 148 }, { "C000000", 148, 160 } },
				{ { "C000000", 0, 12 }, { "C00005f", 12, 14 }, { "C000080", 14, 22 }, { "C000087", 22, 26 }, { "C000080", 26, 28 },  { "C000000", 28, 36 },   { "C0000ff", 36, 38 },   { "C0000d7", 38, 46 },   { "C000000", 46, 116 },  { "C0000d7", 116, 126 }, { "C000000", 126, 134 }, { "C000087", 134, 138 }, { "C000080", 138, 150 }, { "C000000", 150, 160 } },
				{ { "C000000", 0, 10 }, { "C5f005f", 10, 20 }, { "C000087", 20, 30 }, { "C000000", 30, 36 }, { "C0000d7", 36, 46 },  { "C000000", 46, 116 },  { "C0000d7", 116, 124 }, { "C000087", 124, 126 }, { "C000000", 126, 132 }, { "C000087", 132, 142 }, { "C5f005f", 142, 152 }, { "C000000", 152, 160 } },
				{ { "C000000", 0, 8 },  { "C5f005f", 8, 18 },  { "C000000", 18, 22 }, { "C0000af", 22, 30 }, { "C000087", 30, 34 },  { "C000000", 34, 36 },   { "C080808", 36, 38 },   { "C0000d7", 38, 46 },   { "C00005f", 46, 48 },   { "C000000", 48, 114 },  { "C0000af", 114, 116 }, { "C0000d7", 116, 124 }, { "C000000", 124, 128 }, { "C0000af", 128, 140 }, { "C000000", 140, 144 }, { "C5f005f", 144, 154 }, { "C000000", 154, 160 } },
				{ { "C000000", 0, 6 },  { "C5f005f", 6, 16 },  { "C000000", 16, 24 }, { "C000087", 24, 26 }, { "C0000af", 26, 36 },  { "C000087", 36, 38 },   { "C0000d7", 38, 48 },   { "C000000", 48, 114 },  { "C0000d7", 114, 124 }, { "C0000af", 124, 136 }, { "C00005f", 136, 138 }, { "C000000", 138, 144 }, { "C080808", 144, 146 }, { "C5f005f", 146, 154 }, { "C262626", 154, 156 }, { "C000000", 156, 160 } },
				{ { "C000000", 0, 4 },  { "C080808", 4, 6 },   { "C5f005f", 6, 14 },  { "C1c1c1c", 14, 16 }, { "C000000", 16, 28 },  { "C0000af", 28, 40 },   { "C0000d7", 40, 48 },   { "C0000af", 48, 50 },   { "C000000", 50, 112 },  { "C0000d7", 112, 122 }, { "C0000af", 122, 134 }, { "C000000", 134, 146 }, { "C5f005f", 146, 156 }, { "C000000", 156, 160 } },
				{ { "C000000", 0, 4 },  { "C5f005f", 4, 14 },  { "C000000", 14, 32 }, { "C0000af", 32, 40 }, { "C0000d7", 40, 50 },  { "C000080", 50, 52 },   { "C000000", 52, 110 },  { "C0000af", 110, 112 }, { "C0000d7", 112, 122 }, { "C0000af", 122, 130 }, { "C000000", 130, 148 }, { "C5f005f", 148, 158 }, { "C000000", 158, 160 } },
				{ { "C000000", 0, 2 },  { "C5f0000", 2, 4 },   { "C800000", 4, 12 },  { "C000000", 12, 36 }, { "C0000af", 36, 38 },  { "C0000d7", 38, 52 },   { "C0000af", 52, 54 },   { "C000000", 54, 108 },  { "C0000af", 108, 110 }, { "C0000d7", 110, 124 }, { "C000080", 124, 126 }, { "C000000", 126, 150 }, { "C800000", 150, 158 }, { "C5f0000", 158, 160 } },
				{ { "C000000", 0, 2 },  { "C800000", 2, 10 },  { "C5f0000", 10, 12 }, { "C000000", 12, 42 }, { "C0000d7", 42, 54 },  { "C0000af", 54, 56 },   { "C0000d7", 56, 62 },   { "C121212", 62, 64 },   { "C000000", 64, 98 },   { "C00005f", 98, 100 },  { "C0000d7", 100, 106 }, { "C0000af", 106, 108 }, { "C0000d7", 108, 120 }, { "C000000", 120, 150 }, { "C800000", 150, 160 } },
				{ { "C870000", 0, 10 }, { "C000000", 10, 46 }, { "C0000af", 46, 48 }, { "C0000d7", 48, 54 }, { "C0000af", 54, 58 },  { "C0000d7", 58, 104 },  { "C0000af", 104, 108 }, { "C0000d7", 108, 114 }, { "C00005f", 114, 116 }, { "C000000", 116, 152 }, { "C870000", 152, 160 } },
				{ { "C870000", 0, 10 }, { "C000000", 10, 50 }, { "C0000d7", 50, 54 }, { "C0000af", 54, 62 }, { "C0000d7", 62, 100 }, { "C0000af", 100, 108 }, { "C0000d7", 108, 112 }, { "C000000", 112, 152 }, { "C870000", 152, 160 } },
				{ { "C870000", 0, 8 },  { "C000000", 8, 52 },  { "C0000af", 52, 64 }, { "C000087", 64, 66 }, { "C000000", 66, 70 },  { "C00005f", 70, 72 },   { "C0000af", 72, 74 },   { "C0000d7", 74, 78 },   { "C0000ff", 78, 84 },   { "C0000d7", 84, 88 },   { "C000087", 88, 90 },   { "C121212", 90, 92 },   { "C000000", 92, 96 },   { "C0000af", 96, 108 },  { "C000080", 108, 110 }, { "C000000", 110, 152 }, { "C5f0000", 152, 154 }, { "C870000", 154, 160 } },
				{ { "Caf0000", 0, 8 },  { "C000000", 8, 56 },  { "C0000af", 56, 68 }, { "C000087", 68, 70 }, { "C000000", 70, 92 },  { "C0000af", 92, 106 },  { "C000000", 106, 154 }, { "Caf0000", 154, 160 } },
				{ { "Caf0000", 0, 8 },  { "C000000", 8, 60 },  { "C0000af", 60, 68 }, { "C000087", 68, 74 }, { "C00005f", 74, 76 },  { "C000000", 76, 86 },   { "C00005f", 86, 88 },   { "C000087", 88, 92 },   { "C0000af", 92, 102 },  { "C000000", 102, 154 }, { "Caf0000", 154, 160 } },
				{ { "Caf0000", 0, 6 },  { "C121212", 6, 8 },   { "C000000", 8, 64 },  { "C000087", 64, 66 }, { "C0000af", 66, 68 },  { "C000087", 68, 78 },   { "C000080", 78, 80 },   { "C00005f", 80, 82 },   { "C000080", 82, 84 },   { "C000087", 84, 92 },   { "C0000af", 92, 96 },   { "C00005f", 96, 98 },   { "C000000", 98, 154 },  { "C870000", 154, 156 }, { "Caf0000", 156, 160 } },
				{ { "Cd70000", 0, 6 },  { "C000000", 6, 70 },  { "C000087", 70, 72 }, { "C000080", 72, 74 }, { "C5f005f", 74, 76 },  { "C000080", 76, 84 },   { "C000087", 84, 92 },   { "C000000", 92, 154 },  { "C080808", 154, 156 }, { "Cd70000", 156, 160 } },
				{ { "Cd70000", 0, 6 },  { "C000000", 6, 64 },  { "C1c1c1c", 64, 66 }, { "C5f005f", 66, 76 }, { "C000080", 76, 84 },  { "C000087", 84, 86 },   { "C5f005f", 86, 96 },   { "C080808", 96, 98 },   { "C000000", 98, 156 },  { "Cd70000", 156, 160 } },
				{ { "Cd70000", 0, 6 },  { "C000000", 6, 52 },  { "C080808", 52, 54 }, { "C5f005f", 54, 76 }, { "C000080", 76, 78 },  { "C000000", 78, 82 },   { "C121212", 82, 84 },   { "C000080", 84, 86 },   { "C5f005f", 86, 106 },  { "C5f0000", 106, 108 }, { "C000000", 108, 156 }, { "Cd70000", 156, 160 } },
				{ { "Cd70000", 0, 6 },  { "C000000", 6, 36 },  { "C5f0000", 36, 38 }, { "C870000", 38, 46 }, { "C800000", 46, 52 },  { "C5f005f", 52, 70 },   { "C000000", 70, 92 },   { "C5f005f", 92, 108 },  { "C800000", 108, 116 }, { "C870000", 116, 124 }, { "C5f0000", 124, 126 }, { "C000000", 126, 156 }, { "Cd70000", 156, 160 } },
				{ { "Cff0000", 0, 6 },  { "Cd70000", 6, 20 },  { "Caf0000", 20, 36 }, { "C870000", 36, 46 }, { "C800000", 46, 52 },  { "C5f005f", 52, 58 },   { "C1c1c1c", 58, 60 },   { "C000000", 60, 102 },  { "C5f0000", 102, 104 }, { "C5f005f", 104, 108 }, { "C800000", 108, 116 }, { "C870000", 116, 126 }, { "Caf0000", 126, 140 }, { "Cd70000", 140, 156 }, { "Cff0000", 156, 160 } } },
			scaling_factor),
	}

}

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

	local opts = {
		position = "center",
		shortcut = "[" .. sc .. "] ",
		cursor = 1,
		-- width = 50,
		align_shortcut = "left",
		hl_shortcut = { { "Operator", 0, 1 }, { "Number", 1, #sc + 1 }, { "Operator", #sc + 1, #sc + 2 } },
		shrink_margin = false,
	}
	if keybind then
		keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

local file_icons = {
	enabled = true,
	highlight = true,
	-- available: devicons, mini, to use nvim-web-devicons or mini.icons
	-- if provider not loaded and enabled is true, it will try to use another provider
	provider = "mini",
}

local function icon(fn)
	if file_icons.provider ~= "devicons" and file_icons.provider ~= "mini" then
		vim.notify("Alpha: Invalid file icons provider: " .. file_icons.provider .. ", disable file icons",
			vim.log.levels.WARN)
		file_icons.enabled = false
		return "", ""
	end

	local ico, hl = utils.get_file_icon(file_icons.provider, fn)
	if ico == "" then
		file_icons.enabled = false
		vim.notify("Alpha: Mini icons or devicons get icon failed, disable file icons", vim.log.levels.WARN)
	end
	return ico, hl
end

local function file_button(fn, sc, short_fn, autocd)
	short_fn = if_nil(short_fn, fn)
	local ico_txt
	local fb_hl = {}
	if file_icons.enabled then
		local ico, hl = icon(fn)
		local hl_option_type = type(file_icons.highlight)
		if hl_option_type == "boolean" then
			if hl and file_icons.highlight then
				table.insert(fb_hl, { hl, 0, #ico })
			end
		end
		if hl_option_type == "string" then
			table.insert(fb_hl, { file_icons.highlight, 0, #ico })
		end
		ico_txt = ico .. "  "
	else
		ico_txt = ""
	end
	local cd_cmd = (autocd and " | cd %:p:h" or "")
	local file_button_el = button(sc, ico_txt .. short_fn, "<cmd>e " .. vim.fn.fnameescape(fn) .. cd_cmd .. " <CR>")
	local fn_start = short_fn:match(".*[/\\]")
	if fn_start ~= nil then
		table.insert(fb_hl, { "Comment", #ico_txt, #fn_start + #ico_txt })
	end
	file_button_el.opts.hl = fb_hl
	return file_button_el
end

local default_mru_ignore = { "gitcommit" }

local mru_opts = {
	ignore = function(path, ext)
		return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
	end,
	autocd = false
}

--- @param start number
--- @param cwd string? optional
--- @param items_number number? optional number of items to generate, default = 10
local function mru(start, cwd, items_number, opts)
	opts = opts or mru_opts
	items_number = if_nil(items_number, 10)
	local oldfiles = {}
	for _, v in pairs(vim.v.oldfiles) do
		if #oldfiles == items_number then
			break
		end
		local cwd_cond
		if not cwd then
			cwd_cond = true
		else
			cwd_cond = vim.startswith(v, cwd)
		end
		local ignore = (opts.ignore and opts.ignore(v, utils.get_extension(v))) or false
		if (filereadable(v) == 1) and cwd_cond and not ignore then
			oldfiles[#oldfiles + 1] = v
		end
	end

	local tbl = {}
	for i, fn in ipairs(oldfiles) do
		local short_fn
		if cwd then
			short_fn = fnamemodify(fn, ":.")
		else
			short_fn = fnamemodify(fn, ":~")
		end
		local file_button_el = file_button(fn, tostring(i + start - 1), short_fn, opts.autocd)
		tbl[i] = file_button_el
	end
	return {
		type = "group",
		val = tbl,
		opts = {},
	}
end

local function mru_title()
	return "MRU " .. vim.fn.getcwd()
end

local section = {
	header = header,
	top_buttons = {
		type = "group",
		val = {
			button("e", "New file", "<cmd>ene <CR>"),
		},
	},
	-- note about MRU: currently this is a function,
	-- since that means we can get a fresh mru
	-- whenever there is a DirChanged. this is *really*
	-- inefficient on redraws, since mru does a lot of I/O.
	-- should probably be cached, or maybe figure out a way
	-- to make it a reference to something mutable
	-- and only mutate that thing on DirChanged
	mru = {
		type = "group",
		val = {
			{ type = "padding", val = 1 },
			{ type = "text",    val = "MRU", opts = {position = "center", hl = "SpecialComment" } },
			{ type = "padding", val = 1 },
			{
				type = "group",
				val = function()
					return { mru(10) }
				end,
			},
		},
	},
	mru_cwd = {
		type = "group",
		position = "center",
		val = {
			{ type = "padding", val = 1 },
			{ type = "text",    val = mru_title,  opts = { position = "center", hl = "SpecialComment", shrink_margin = false } },
			{ type = "padding", val = 1 },
			{
				type = "group",
				val = function()
					return { mru(0, vim.fn.getcwd()) }
				end,
				opts = { shrink_margin = false },
			},
		},
	},
	bottom_buttons = {
		type = "group",
		val = {
			button("q", "Quit", "<cmd>q <CR>"),
		},
	},
	footer = {
		type = "group",
		val = {},
	},
}

local config = {
	layout = {
		{ type = "padding", val = 1 },
		section.header,
		{ type = "padding", val = 2 },
		section.top_buttons,
		section.mru_cwd,
		section.mru,
		{ type = "padding", val = 1 },
		section.bottom_buttons,
		section.footer,
	},
	opts = {
		margin = 3,
		redraw_on_resize = true,
		setup = function()
			vim.api.nvim_create_autocmd('DirChanged', {
				pattern = '*',
				group = "alpha_temp",
				callback = function()
					require('alpha').redraw()
					vim.cmd('AlphaRemap')
				end,
			})
		end,
	},
}

return {
	icon = icon,
	button = button,
	file_button = file_button,
	mru = mru,
	mru_opts = mru_opts,
	section = section,
	config = config,
	-- theme config
	file_icons = file_icons,
	-- deprecated
	nvim_web_devicons = file_icons,
	leader = leader,
	-- deprecated
	opts = config,
}
