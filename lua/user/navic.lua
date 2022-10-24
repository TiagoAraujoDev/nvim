local navic_status_ok, navic = pcall(require, "nvim-navic")
if not navic_status_ok then
	return
end

local feline_status_ok, feline = pcall(require, "feline")
if not feline_status_ok then
	return
end

local components = {
	active = { {}, {}, {} },
}

table.insert(components.active[1], {
	provider = function()
		return navic.get_location()
	end,
	enabled = function()
		return navic.is_available()
	end,
})

feline.winbar.setup({
	components = components,
})

navic.setup({
	icons = {
		File = " ",
		Module = " ",
		Namespace = " ",
		Package = " ",
		Class = " ",
		Method = " ",
		Property = " ",
		Field = " ",
		Constructor = " ",
		Enum = "練",
		Interface = "練",
		Function = " ",
		Variable = " ",
		Constant = " ",
		String = " ",
		Number = " ",
		Boolean = "◩ ",
		Array = " ",
		Object = " ",
		Key = " ",
		Null = "ﳠ ",
		EnumMember = " ",
		Struct = " ",
		Event = " ",
		Operator = " ",
		TypeParameter = " ",
	},
	highlight = false,
	separator = " > ",
	depth_limit = 0,
	depth_limit_indicator = "..",
})

vim.g.navic_silence = true
