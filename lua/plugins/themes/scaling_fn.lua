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

return{
	scale_header = scale_header,
	scale_hl = scale_header_highlights,
	}
