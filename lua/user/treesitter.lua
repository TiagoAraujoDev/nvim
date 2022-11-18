local status_ts_ok, _ = pcall(require, "nvim-treesitter")
if not status_ts_ok then
	return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	-- ensure_installed = {
	-- 	"lua",
	-- 	"markdown",
	-- 	"markdown_inline",
	-- 	"bash",
	-- 	"python",
	-- 	"javascript",
	-- 	"typescript",
	-- 	"tsx",
	-- 	"html",
	-- 	"css",
	-- }, -- put the language you want in this array

  auto_install = true,
	ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)

	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "json" }, -- list of language that will be disabled
	},
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

	autopairs = {
		enable = true,
	},

	autotag = {
		enable = true,
		filetypes = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"rescript",
			"css",
			"lua",
			"xml",
			"php",
			"markdown",
		},
	},

	indent = { enable = true, disable = { "python", "css" } },

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
