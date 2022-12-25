local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

-- diagnostics highlight
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#e3c817" })
local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  always_visible = true,
}

-- branch highlight
vim.api.nvim_set_hl(0, "GitSignsCorrentLineBlame", { fg = "#9ece6a", bg = "#3b4261" })
vim.api.nvim_set_hl(0, "GitSignsDeletePreview", { fg = "#7aa2f7", bg = "#3b4261" })
local branchIcon = "%#GitSignsCorrentLineBlame#" .. " " .. "%*" .. "%#GitSignsDeletePreview#"
local branch = {
  "branch",
  icon = branchIcon,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local filetype = {
  "filetype",
  icons_enabled = true,
}

local location = {
  "location",
  padding = 1,
}

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local mode = {
  -- mode component
  function()
    -- return " "
    -- return " "
    -- return " "
    -- return " "
    -- return " "
    return "ﰆ "
    -- return " "
    -- return ""
    -- return " "
    -- return " "
    -- return " "
  end,
  padding = 1,
}

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "tokyonight",
    component_separators = { left = "", right = "" },

    -- styling section separators options 
    -- section_separators = { left = "", right = "" },
    -- section_separators = { left = "  ", right = "  " },
    section_separators = { left = "", right = "" },

    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch },
    lualine_c = { diagnostics },
    lualine_x = { diff, spaces, "encoding", filetype },
    lualine_y = { location },
    lualine_z = { "progress" },
  },
}
