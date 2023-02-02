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
    return " "
    -- return " "
    -- return " "
    -- return "ﰆ "
    -- return " "
    -- return ""
    -- return " "
    -- return " "
    -- return " "
  end,
  padding = 1,
}

local lsp = {
  function(msg)
    msg = msg or "LS Inactive"
    local buf_clients = vim.lsp.buf_get_clients()
    if next(buf_clients) == nil then
      -- TODO: clean up this if statement
      if type(msg) == "boolean" or #msg == 0 then
        return "LS Inactive"
      end
      return msg
    end
    -- local buf_ft = vim.bo.filetype
    local buf_client_names = {}

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" and client.name ~= "copilot" then
        table.insert(buf_client_names, client.name)
      end
    end

    -- add formatter
    -- local formatters = require "lvim.lsp.null-ls.formatters"
    -- local supported_formatters = formatters.list_registered(buf_ft)
    -- vim.list_extend(buf_client_names, supported_formatters)

    -- add linter
    -- local linters = require "lvim.lsp.null-ls.linters"
    -- local supported_linters = linters.list_registered(buf_ft)
    -- vim.list_extend(buf_client_names, supported_linters)

    local unique_client_names = vim.fn.uniq(buf_client_names)

    local language_servers = " LSP: " .. table.concat(unique_client_names, ", ") .. " "

    return language_servers
  end,
  color = { gui = "bold" },
  cond = hide_in_width,
}

local treesitter = {
  function ()
    local buf = vim.api.nvim_get_current_buf()
    local highlighter = vim.treesitter.highlighter
    if highlighter.active[buf] then
     -- treesitter highlighting is enabled
      return " "
    end
    return ""
  end,
  color = { fg = "#41a32f"}
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
    lualine_x = { lsp, treesitter, diff, filetype },
    lualine_y = { location },
    lualine_z = { "progress" },
  },
}
