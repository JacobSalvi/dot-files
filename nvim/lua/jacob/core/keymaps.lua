-- set leader key
vim.g.mapleader = " "

local keymap = vim.keymap

-- delete single character without copying into register
keymap.set({'n', 'v'}, 'd', '"_d', { noremap = true })
keymap.set('n', 'dd', '"_dd', { noremap = true })
keymap.set("n", "x", '"_x')

keymap.set("n","o","o<ESC>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- nvim-tree
keymap.set("n","<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>pc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>ph", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- term
keymap.set("n", '<leader>tr', "<cmd>ToggleTerm size=10 direction=horizontal<cr>")
keymap.set("n", '<leader>tf', "<cmd>ToggleTerm size=10 direction=float<cr>")

keymap.set("n", '<leader>ast', ":ASToggle<CR>")

