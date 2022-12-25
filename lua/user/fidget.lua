local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
  return
end

vim.api.nvim_set_hl(0, "FidgetTask", { fg = "#abbb2f", bg = "none"})

fidget.setup()
