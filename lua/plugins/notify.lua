local notify = require("notify")

notify.setup({
    background_colour = "#282a36"
})

vim.notify = notify
