vim.g.clipboard = {
    name = 's3-clipboard',
    copy = {
        ['+'] = "s3c copy",
        ['*'] = "s3c copy",
    },
    paste = {
        ['+'] = "s3c paste",
        ['*'] = "s3c paste",
    }
}

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
