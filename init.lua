-- Remap functions
function Vscode_terminalToogle()
	vim.fn.VSCodeNotify("workbench.action.terminal.toggleTerminal")
end
function Vscode_multiCursor()
	vim.fn.VSCodeNotify("editor.action.addSelectionToNextFindMatch")
end
function Vscode_comment()
	vim.fn.VSCodeNotify("editor.action.commentLine")
end
function Vscode_blockComment()
	vim.fn.VSCodeNotify("editor.action.blockComment")
end
function Vscode_saveFile()
	vim.fn.VSCodeNotify("workbench.action.files.save")
end
function Vscode_closeEditor()
	vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")
end
function Vscode_showHover()
	vim.fn.VSCodeNotify("editor.action.showHover")
end
function Vscode_error()
	vim.fn.VSCodeNotify("editor.action.marker.next")
end
function Vscode_prevTab()
	vim.fn.VSCodeNotify("workbench.action.previousEditor")
end
function Vscode_nextTab()
	vim.fn.VSCodeNotify("workbench.action.nextEditor")
end
function Vscode_explorer()
	vim.fn.VSCodeNotify("workbench.view.explorer")
end

if vim.g.vscode then
  vim.g.mapleader = " "

	vim.keymap.set("v", "<leader>/", Vscode_blockComment)
	vim.keymap.set("n", "<leader>/", Vscode_comment)
	vim.keymap.set("n", "<leader>w", Vscode_saveFile)
	vim.keymap.set("n", "<leader>q", Vscode_closeEditor)
	vim.keymap.set("n", "K", Vscode_showHover)
	vim.keymap.set("n", "gl", Vscode_error)
	vim.keymap.set("n", "H", Vscode_prevTab)
	vim.keymap.set("n", "L", Vscode_nextTab)
	vim.keymap.set("n", "<leader>e", Vscode_explorer)
	vim.keymap.set("v", "<leader>n", Vscode_multiCursor)
  vim.keymap.set("n", "<C-l>", Vscode_terminalToogle)

	require("user.plugins")
	require("user.todo-comments")
	require("user.neoscroll")
else
	require("user.options")
	require("user.keymaps")
	require("user.plugins")
	require("user.autocommands")
	require("user.colorscheme")
	require("user.cmp")
	require("user.telescope")
	require("user.gitsigns")
	require("user.treesitter")
	require("user.autopairs")
	require("user.comment")
	require("user.nvim-tree")
	require("user.lualine")
	require("user.toggleterm")
	require("user.project")
	require("user.impatient")
	require("user.illuminate")
	require("user.indentline")
	require("user.alpha")
	require("user.lsp")
	require("user.neoscroll")
	require("user.colorizer")
	require("user.todo-comments")
	require("user.surround")
	require("user.winbar")
	require("user.navic")
	require("user.cybu")
	require("user.fidget")
	require("user.jaq")
	require("user.lab")
end
