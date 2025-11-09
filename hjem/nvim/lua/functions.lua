function Dump(object, level)
	if not level then
		level = 1
	end
	if type(object) == "table" then
		local string = "{\n" .. string.rep("  ", level)
		local parts = {}
		for key, value in pairs(object) do
			table.insert(parts, key .. " = " .. Dump(value, level + 1))
		end
		string = string .. table.concat(parts, ",\n" .. string.rep("  ", level))
		return string .. "\n" .. string.rep("  ", level - 1) .. "}"
	else
		return tostring(object)
	end
end
