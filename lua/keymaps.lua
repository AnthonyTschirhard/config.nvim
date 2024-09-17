-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- vim: ts=2 sts=2 sw=2 et

-- Navigation
vim.keymap.set({ "n", "v" }, "<A-j>", "b", { desc = "Backward one word" })
vim.keymap.set({ "n", "v" }, "<A-k>", "w", { desc = "Forward one word" })
vim.keymap.set({ "n", "v" }, "<S-k>", "30k", { desc = "Page up" })
vim.keymap.set({ "n", "v" }, "<S-j>", "30j", { desc = "Page down" })

-- split windows
vim.keymap.set("n", "<leader>vs", ":vs<CR>")
vim.keymap.set("n", "<leader>hs", ":split<CR>")

-- text edition
vim.keymap.set("n", "yY", ":%y+<CR>")
vim.keymap.set("n", "<A-BS>", "ciw")
vim.keymap.set("i", "<A-BS>", "<C-w>")

-- buffers
vim.keymap.set(
	"n",
	"<leader>i",
	":BufferLineCyclePrev<cr>",
	{ desc = "Cycle through buffers left. (Mnemonic: overlaps with jumplist navigation <C-i>)" }
)
vim.keymap.set(
	"n",
	"<leader>o",
	":BufferLineCycleNext<cr>",
	{ desc = "Cycle through buffers right. (Mnemonic: overlaps with jumplist navigation <C-o>)" }
)
-- vim.keymap.set('n', '<leader>I', ':BufferLineMovePrev<cr>',
--   { desc = 'Move current buffer to the left in the bufferline' })
-- vim.keymap.set('n', '<leader>O', ':BufferLineMoveNext<cr>',
--   { desc = 'Move current buffer to the right in the bufferline' })
vim.keymap.set(
	"n",
	"<leader>q",
	":bp<bar>sp<bar>bn<bar>bd<CR>",
	{ desc = "Delete buffer without changing window layout" }
)
vim.keymap.set("n", "<leader>Q", ":bd!<cr>", { desc = "Force delete buffer without changing window layout" })
vim.keymap.set("n", "<leader>0", ":%bd|e#|bd#<cr>", { desc = "Close all buffers except current" })
vim.keymap.set("n", "<leader>w", ":w<cr>", { desc = "Save Buffer" })
vim.keymap.set("n", "<leader>W", ":w|bd<cr>", { desc = "Save and Delete Buffer" })
vim.keymap.set("n", "<leader>cp", ':let @+ = expand("%:p")<cr>', { desc = "[C]opy absolute [P]ath" })
