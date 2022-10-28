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
  symbols = { error = " ", warn = " " },
  colored = true,
  always_visible = true,
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
  padding = 0,
}

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end
-- local mode_color = {
--   n = "blue",
--   i = "orange",
--   v = "#b668cd",
--   [""] = "#b668cd",
--   V = "#b668cd",
--   -- c = '#B5CEA8',
--   -- c = '#D7BA7D',
--   c = "#46a6b2",
--   no = "#D16D9E",
--   s = "green",
--   S = "orange",
--   [""] = "orange",
--   ic = "red",
--   R = "#D16D9E",
--   Rv = "red",
--   cv = "blue",
--   ce = "blue",
--   r = "red",
--   rm = "#46a6b2",
--   ["r?"] = "#46a6b2",
--   ["!"] = "#46a6b2",
--   t = "red",
-- }

local mode = {
  -- mode component
  function()
    -- return "    "
    return "    "
    -- return "    "
  end,
  -- color = function()
  --   auto change color according to neovims mode
  --   return { fg = mode_color[vim.fn.mode()], bg = gray }
  -- end,
  padding = 0,
}

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "  ", right = "  " },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = {"branch"},
    lualine_c = { diagnostics },
    lualine_x = { diff, spaces, "encoding", filetype },
    lualine_y = { location },
    lualine_z = { "progress" },
  },
}
