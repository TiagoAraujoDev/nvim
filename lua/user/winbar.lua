local M = {}

local function isempty(text)
	return text == nil or text == ""
end

local icons = require("user.icons")

-- Highlight winbar
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsNamespace TSNamespace
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsEnum CmpItemKindEnum
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsEnumMember CmpItemKindEnumMember
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsKey CmpItemKindKey
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsPackage CmpItemKindPackage
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsTypeParameter CmpItemKindTypeParameter
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsEvent CmpItemKindEvent
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsConstructor CmpItemKindConstructor
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsOperator CmpItemKindOperator
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsField CmpItemKindField
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsStruct CmpItemKindStruct
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsProperty CmpItemKindProperty
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsInterface CmpItemKindInterface
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsConstant CmpItemKindConstant
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsNumber CmpItemKindValue
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsClass CmpItemKindClass
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsBoolean TSBoolean
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsArray CmpItemKindDefault
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsString CmpItemKindText
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi link NavicIconsModule CmpItemKindModule
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[ 
      hi NavicText ctermfg=11 guifg=#565c64 guibg=NONE
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[
      hi link NavicIconsMethod CmpItemKindMethod
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[
      hi link NavicIconsVariable CmpItemKindVariable
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[
      hi link NavicIconsFunction CmpItemKindFunction
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[
      hi link NavicIconsObject CmpItemKindClass
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd([[
      hi link NavicIconsString CmpItemKindText
    ]])
	end,
})

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
