local tree = require("nvim-tree")
local api = require("nvim-tree.api")

tree.setup({
    sync_root_with_cwd = true,
    view = {
        width = 50,
        side = "left",
    },
    actions = {
        open_file = {
            resize_window = true,
            window_picker = {
                enable = false,
            },
        },
        change_dir = {
            restrict_above_cwd = true
        }
    },
    git = {
        ignore = false,
    },
    diagnostics = {
        enable = true,
    },
})

vim.keymap.set("n", "<leader>pv", function() api.tree.focus() end)
vim.keymap.set("n", "<leader>pc", function() api.tree.toggle({ focus = false }) end)
