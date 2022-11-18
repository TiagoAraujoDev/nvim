local status_ts_ok, _ = pcall(require, "nvim-treesitter")
if not status_ts_ok then
	return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

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
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = {
			-- "#e06c75",
			-- "#98c379",
			-- "#e5c07b",
			-- "#61afef",
			-- "#c678dd",
			-- "#56b6c2",
			-- "#be5046",
			-- "#d19a66",
			-- "#b45bcf",
			"Orchid",
			"DodgerBlue",
			"Gold",
		}, -- table of hex strings
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
