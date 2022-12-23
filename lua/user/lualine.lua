local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  diagnostics_color = {
    -- Same values as the general color option can be used here.
    error = 'DiagnosticError', -- Changes diagnostics' error color.
    warn  = 'Tag',  -- Changes diagnostics' warn color.
  },
  symbols = { error = " ", warn = " " },
  colored = false,
  always_visible = true,
}

local branchIcon = "%#Todo#" .. " " .. "%*" .. "%#TSoperator#"
local branch = {
  "branch",
  icon = branchIcon,
  -- color = { bg = "#3e4451", gui = "italic"}
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
    return " "
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
    section_separators = { left = "", right = "" },
    -- section_separators = { left = "  ", right = "  " },

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
