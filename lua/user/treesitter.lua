local status_ts_ok, _ = pcall(require, "nvim-treesitter")
if not status_ts_ok then
	return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

-- vim.api.nvim_set_hl(0, "rainbowcol1", { fg = "#C5BD00"})
-- vim.api.nvim_set_hl(0, "rainbowcol2", { fg = "#C678DD"})
-- vim.api.nvim_set_hl(0, "rainbowcol3", { fg = "#628BDA"})
-- vim.api.nvim_set_hl(0, "rainbowcol4", { fg = "#C5BD00"})
-- vim.api.nvim_set_hl(0, "rainbowcol5", { fg = "#C678DD"})
-- vim.api.nvim_set_hl(0, "rainbowcol6", { fg = "#628BDA"})
-- vim.api.nvim_set_hl(0, "rainbowcol7", { fg = "#C5BD00"})

configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages
	sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
  auto_install = true, -- Automatic install the parse when enter the file
	ignore_install = { "" }, -- List of parsers to ignore installing

  -- Treesitter syntax highlight
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "json" }, -- list of language that will be disabled
	},

  -- Closes the html tags
 	autotag = {
		enable = true,
	},

  -- Parantheses, curly brackets and brackets highlight
	rainbow = {
		enable = true,
		disable = { "php", "cpp", "html" }, -- list of languages you want to disable the plugin for
		extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
      "DodgerBlue",
      "Orchid",
      "Gold",
    },
		-- termcolors = {} -- table of colour name strings
	},

  -- Smart indent
	indent = { enable = true, disable = { "python", "css" } },

  -- Comments
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},

  -- Automatically closes parantheses, curly brackets and brackets highlight
	autopairs = {
		enable = true,
	},
})
