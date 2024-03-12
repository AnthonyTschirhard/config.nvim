vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "NvimTree",
                text_align = "center",
                separator = true,
            }
        },
    }
}

-- manage buffers
vim.keymap.set("n", "<C-left>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<C-right>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<A-left>", ":BufferLineMovePrev<CR>")
vim.keymap.set("n", "<A-right>", ":BufferLineMoveNext<CR>")
