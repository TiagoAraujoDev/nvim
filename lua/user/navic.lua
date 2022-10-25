local M = {}
local navic_status_ok, navic = pcall(require, "nvim-navic")
if not navic_status_ok then
	return
end

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
	highlight = true,
	separator = " > ",
	depth_limit = 0,
	depth_limit_indicator = "..",
})

function M.eval()
  local file_name = vim.api.nvim_eval_statusline('%t', {}).str
  local modified = vim.api.nvim_eval_statusline('%m', {}).str == '[+]' and '●' or ''
  -- print(navic.get_data())

  return string.format('%s > %s %s', file_name, navic.get_location(), modified)
end


vim.g.navic_silence = true
return M
