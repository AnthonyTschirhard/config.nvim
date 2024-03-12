local neotest = require("neotest")

local python_path = ".venv/bin/python"

if vim.fn.has("win32") == 1 then
    python_path = ".venv/Scripts/python"
end

neotest.setup({
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false },
            runner = "unittest",
            python = python_path,
        })
    },
    icons = {
        passed = " ",
        failed = " ",
        running_animated = { "󱑋 ", "󱑌 ", "󱑍 ", "󱑎 ", "󱑏 ", "󱑐 ", "󱑑 ", "󱑒 ", "󱑓 ", "󱑔 ",
            "󱑕 ", "󱑖 " },
        running = "󰦖 ",
        unknown = " ",
        skipped = " ",
    },
})

vim.keymap.set(
    "n",
    "<leader>tt",
    function()
        neotest.summary.toggle()
        vim.cmd("wincmd =")
    end
)
vim.keymap.set("n", "<leader>to", function() neotest.output.open() end)
vim.keymap.set(
    "n",
    "<leader>tr",
    function()
        vim.cmd('w')
        neotest.run.run()
    end
)

vim.keymap.set(
    "n",
    "<leader>td",
    function()
        vim.cmd("w")
        neotest.run.run({ strategy = "dap" })
    end
)
vim.keymap.set("n", "<leader>ts", function() neotest.run.stop() end)
vim.keymap.set(
    "n",
    "<leader>tf",
    function()
        vim.cmd("w")
        neotest.run.run(vim.fn.expand("%"))
    end
)
vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end)
