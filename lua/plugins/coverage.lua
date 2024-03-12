local coverage = require("coverage")

local coverage_cmd = "coverage json -q -o -"

if vim.fn.has("win32") == 1 then
    coverage_cmd = "\"" .. coverage_cmd .. "\""
end

coverage.setup({
    auto_reload = true,
    highlights = {
        covered = { fg = "#50fa7b" },
        uncovered = { fg = "#ff5555" },
        partial = { fg = "#ffb86c" },
    },
    lang = {
        python = {
            coverage_command = coverage_cmd
        }
    },

})

vim.keymap.set(
    "n",
    "<leader>cl",
    function()
        coverage.load()
    end
)

vim.keymap.set(
    "n",
    "<leader>co",
    function()
        coverage.show()
    end
)

vim.keymap.set(
    "n",
    "<leader>cs",
    function()
        coverage.summary()
    end
)
