local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal

local is_windows = vim.fn.has("win32") == 1

local function format_cmd(cmd)
    local prepend = ""

    if is_windows then
        prepend = "bash -c "
    end

    return prepend .. cmd
end

toggleterm.setup({
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<A-t>]],
    direction = "float",
    float_opts = {
        border = "curved",
    },
    quote_command = is_windows,
})

local lazygit_cmd = format_cmd("lazygit")
local gotop_cmd = format_cmd("gotop")
local python_cmd = format_cmd("python")

local lazygit = Terminal:new({ cmd = lazygit_cmd, hidden = true })
local gotop = Terminal:new({ cmd = gotop_cmd, hidden = true })
local python = Terminal:new({ cmd = python_cmd, hidden = true })

vim.keymap.set("n", "<leader>gg", function() lazygit:toggle() end)
vim.keymap.set("n", "<leader>pp", function() gotop:toggle() end)
vim.keymap.set("n", "<leader>py", function() python:toggle() end)
