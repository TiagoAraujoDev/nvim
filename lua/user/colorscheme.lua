local colorscheme = "base16-onedark"
-- local colorscheme = "base16-ia-dark"
-- local colorscheme = "base16-dracula"
-- local colorscheme = "base16-synth-midnight-dark"
-- local colorscheme = "base16-google-dark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
