-- Close with "q"
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]])
	end,
})

-- Set spell checking for markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit"},
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
	callback = function()
		vim.cmd("quit")
	end,
})

-- After a comment line don't comment again
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- Yank visual effect
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

-- Illuminate highlight config
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd [[ 
      hi LspReferenceRead gui=NONE guibg=#424A56
    ]]
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd [[ 
      hi LspReferenceWrite gui=NONE guibg=#424A56
    ]]
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd [[ 
      hi LspReferenceText gui=NONE guibg=#424A56
    ]]
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd [[ 
      hi IlluminatedWordRead gui=NONE guibg=#424A56
    ]]
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd [[ 
      hi IlluminatedWordWrite gui=NONE guibg=#424A56
    ]]
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd [[ 
      hi IlluminatedWordText gui=NONE guibg=#424A56
    ]]
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd [[ 
      hi link illuminatedWord LspReferenceText
    ]]
	end,
})

-- Fix the column number bg
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd [[ 
      hi CursorLineNr cterm=underline ctermfg=11 gui=bold guifg=#aaaaaa guibg=NONE
    ]]
	end,
})

-- Fix the cmp menu item bg
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd [[ 
      hi CmpItemAbbr guifg=#abb2bf guibg=NONE
    ]]
	end,
})
