-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<leader>w", "<cmd>w<CR>", opts)
keymap("n", "<leader>q", "<cmd>q<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- Jaq
keymap("n", "<A-r>", ":Jaq<CR>", opts)

-- Lab
keymap("n", "<A-0>", ":Lab code run<CR>", opts)
keymap("n", "<A-9>", ":Lab code stop<CR>", opts)


-- Harpoon
keymap("n", "<TAB>", ":Telescope harpoon marks initial_mode=normal<CR>", opts)
keymap("n", "mm", ":lua require('harpoon.mark').add_file()<CR>")

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>b", ":Telescope buffers initial_mode=normal<CR><ESC>", opts)
keymap("n", "<leader>fk", ":Telescope keymaps<CR>", opts)
keymap("n", "<leader>fc", ":Telescope colorscheme<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Gitsigns
keymap("n", "<leader>gp", '<cmd>Gitsigns preview_hunk<CR>', opts)
keymap("n", "<leader>gd", '<cmd>Gitsigns diffthis<CR>', opts)
keymap('n', '<leader>gD', '<cmd>lua require"gitsigns".diffthis("~")<CR>', opts)
keymap("n", "<leader>glb", '<cmd>Gitsigns toggle_current_line_blame<CR>', opts)
keymap('n', '<leader>gtd', '<cmd>Gitsigns toggle_deleted<CR>', opts)

