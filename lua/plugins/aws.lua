require('s3edit').setup()

vim.keymap.set("n", "<leader>ed", function()
    require('s3edit').edit()
end)
