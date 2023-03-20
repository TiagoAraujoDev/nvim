--[[
-- Nightfox configuration
--]]
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    module_default = true,  -- Default enable value for modules
    styles = {              -- Style to be applied to different syntax groups
      comments = "italic",    -- Value is any valid attr-list value `:help attr-list`
      conditionals = "italic",
      constants = "NONE",
      functions = "bold",
      keywords = "NONE",
      numbers = "NONE",
      operators = "bold",
      strings = "NONE",
      types = "italic,bold",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = { all = { syntax = { operator = "#4470b8" } } },
  groups = {},
})

--[[
-- Tokyonight configuration
--]]
require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = { bold = true },
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "transparent", -- style for sidebars, see below
    floats = "transparent", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
})

-- local colorscheme = "tokyonight"
-- local colorscheme = "darkplus"
local colorscheme = "base16-onedark"
-- local colorscheme = "base16-ia-dark"
-- local colorscheme = "base16-dracula"
-- local colorscheme = "base16-synth-midnight-dark"
-- local colorscheme = "base16-google-dark"
-- local colorscheme = "nightfox"
-- local colorscheme = "carbonfox"
-- local colorscheme = "nightfox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
