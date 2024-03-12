local neoclip = require("neoclip")
local telescope = require("telescope")

neoclip.setup()
telescope.load_extension("neoclip")
vim.keymap.set("n", "<leader>cv", ":Telescope neoclip<CR>")
