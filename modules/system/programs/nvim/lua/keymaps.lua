local map = vim.keymap.set

---------- KEYMAPS ----------

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Keymaps for tabs and spaces manipulation
map("n", "<leader>i2", ":%s/  /\\t/g<CR>", { desc = "Switch [I]ndentation from [2] spaces to tabs" })
map("n", "<leader>i4", ":%s/    /\\t/g<CR>", { desc = "Switch [I]ndentation from [4] spaces to tabs" })

-- Tab management
map("n", "<C-W>tt", ":tabnew | Telescope find_files<CR>", { desc = "Open new [T]ab with [T]elescope" })
map("n", "<C-W>tw", ":tabclose<CR>", { desc = "Close current tab" })
map("n", "<C-W>t1", ":tabfirst<CR>", { desc = "[T]ab [1]" })
map("n", "<C-W>t2", ":tabnext 2<CR>", { desc = "[T]ab [2]" })
map("n", "<C-W>t3", ":tabnext 3<CR>", { desc = "[T]ab [3]" })
map("n", "<C-W>t4", ":tabnext 4<CR>", { desc = "[T]ab [4]" })
map("n", "<C-W>t5", ":tabnext 5<CR>", { desc = "[T]ab [5]" })
map("n", "<C-W>t6", ":tabnext 6<CR>", { desc = "[T]ab [6]" })
map("n", "<C-W>t7", ":tabnext 7<CR>", { desc = "[T]ab [7]" })
map("n", "<C-W>t8", ":tabnext 8<CR>", { desc = "[T]ab [8]" })
map("n", "<C-W>t9", ":tabnext 9<CR>", { desc = "[T]ab [9]" })
map("n", "<C-W>t0", ":tabnext 10<CR>", { desc = "[T]ab 1[0]" })
map("n", "<C-W>tl", ":tablast<CR>", { desc = "[T]ab [L]ast" })

-- Indentation
map("x", "<Tab>", ">gv", { desc = "Indent Once" })
map("x", "<S-Tab>", "<gv", { desc = "Outdent Once" })

-- Easier command
map({"n", "x"}, ";", ":", { desc = "Easier command (map ; to :)" })

-- Ctrl+Delete in insert mode
map("i", "<C-Delete>", "<C-o>dw", { desc = "Delete a word forward in insert mode" })

-- Bind Esc to exit yazi
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		if vim.endswith(vim.fn.expand('%'), '/run/current-system/sw/bin/yazi') then
			vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', '<C-\\><C-N>:q<CR>', { noremap = true, silent = true })
		end
	end,
})
