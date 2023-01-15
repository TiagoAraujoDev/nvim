local M = {}

local function isempty(text)
	return text == nil or text == ""
end

local icons = require("user.icons")

-- Highlight winbar
vim.api.nvim_set_hl(0, "NavicIconsNamespace", { fg = "#7dcfff"})
vim.api.nvim_set_hl(0, "NavicIconsEnum", { fg = "#e3ae1e"})
vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { fg = "#e36c39"})
vim.api.nvim_set_hl(0, "NavicIconsKey", { fg = "#40d68e"})
vim.api.nvim_set_hl(0, "NavicIconsPackage", { fg = "#34c40c"})
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { fg = "#2c8bb8"})
vim.api.nvim_set_hl(0, "NavicIconsEvent", { fg = "#1151ab"})
vim.api.nvim_set_hl(0, "NavicIconsConstructor", { fg = "#837cd9"})
vim.api.nvim_set_hl(0, "NavicIconsOperator", { fg = "#bf0b23"})
vim.api.nvim_set_hl(0, "NavicIconsField", { fg = "#e3ae1e"})
vim.api.nvim_set_hl(0, "NavicIconsStruct", { fg = "#7dcfff"})
vim.api.nvim_set_hl(0, "NavicIconsProperty", { fg = "#1151ab"})
vim.api.nvim_set_hl(0, "NavicIconsInterface", { fg = "#e36c39"})
vim.api.nvim_set_hl(0, "NavicIconsConstant", { fg = "#bf0b23"})
vim.api.nvim_set_hl(0, "NavicIconsNumber", { fg = "#e3ae1e"})
vim.api.nvim_set_hl(0, "NavicIconsClass", { fg = "#34c40c"})
vim.api.nvim_set_hl(0, "NavicIconsBoolean", { fg = "#e36c39"})
vim.api.nvim_set_hl(0, "NavicIconsArray", { fg = "#e3ae1e"})
vim.api.nvim_set_hl(0, "NavicIconsModule", { fg = "#e36c39"})
vim.api.nvim_set_hl(0, "NavicText", { fg = "#565c64", bg = "none"})
vim.api.nvim_set_hl(0, "NavicIconsMethod", { fg = "#bf0b23"})
vim.api.nvim_set_hl(0, "NavicIconsVariable", { fg = "#1151ab"})
vim.api.nvim_set_hl(0, "NavicIconsFunction", { fg = "#1151ab"})
vim.api.nvim_set_hl(0, "NavicIconsObject", { fg = "#bf0b23"})
vim.api.nvim_set_hl(0, "NavicIconsString", { fg = "#34c40c"})

function M.filename()
	local file_name = vim.fn.expand("%:t")

	local extension = ""
	local file_icon = ""
	local file_icon_color = ""

	if not isempty(file_name) then
		extension = vim.fn.expand("%:e")

		local default = false
		if isempty(extension) then
			extension = ""
			default = true
		end
		file_icon, file_icon_color =
			require("nvim-web-devicons").get_icon_color(file_name, extension, { default = default })

		local hl_group = "FileIconColor" .. extension

    if not file_icon then
      file_icon = ""
    end

		vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })

		return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. file_name
	end
end


function M.eval()
	local navic_status_ok, navic = pcall(require, "nvim-navic")
	if not navic_status_ok then
		return ""
	end

  local gps_status_ok, gps = pcall(navic.get_location, {})
  if not gps_status_ok then
    return ""
  end

	if not navic.is_available() or gps == "error" then
		return ""
	end

	local filename = M.filename()

	local modified = vim.api.nvim_eval_statusline("%m", {}).str == "[+]" and icons.ui.BigCircle or ""

	if not isempty(navic.get_location()) then
		return filename .. " " .. "%#LineNr#" .. ">" .. "%*" .. " " .. navic.get_location() .. " " .. modified
	elseif isempty(navic.get_location()) then
		return filename .. " " .. modified
	end
end

vim.g.navic_silence = true

return M
