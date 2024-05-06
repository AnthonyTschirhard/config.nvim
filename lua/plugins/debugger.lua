require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

local on_linux = vim.loop.os_uname().sysname == "Linux"
local debugpy_path = on_linux and "~/.virtualenvs/debugpy/bin/python" or "~/.virtualenvs/debugpy/Scripts/python.exe"

require("dap-python").setup(debugpy_path)
require("persistent-breakpoints").setup({
    load_breakpoints_event = { "BufReadPost" }
})

local dap, dapui = require("dap"), require("dapui")
local tree = require('nvim-tree.api')
local breakpoints = require("persistent-breakpoints.api")

dapui.setup({
    layouts = {
        {
            elements = {
                {
                    id = "scopes",
                    size = 0.40
                },
                {
                    id = "watches",
                    size = 0.35
                },
                {
                    id = "breakpoints",
                    size = 0.25
                },
            },
            position = "left",
            size = 0.3
        },
        {
            elements = {
                {
                    id = "repl",
                    size = 1
                }
            },
            position = "top",
            size = 1,
        },
        {
            elements = {
                {
                    id = "console",
                    size = 1
                },
            },
            position = "bottom",
            size = 15,
        }
    },
})

local function on_enter()
    dapui.open()
    tree.tree.close()
    vim.keymap.set('n', '<leader>dr', function() dapui.float_element("repl") end)
end

local function on_exit()
    dapui.close()
end

dap.listeners.after.event_initialized["dapui_config"] = function()
    on_enter()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    on_exit()
end

dap.listeners.after.event_exited["dapui_config"] = function()
    on_exit()
end

-- read vscode launch.json config
local function read_launch_json()
    require("dap.ext.vscode").load_launchjs()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = read_launch_json })

-- debugger
vim.keymap.set(
    { "n", "i", "v" },
    "<F5>",
    function()
        vim.cmd("w")
        dap.continue()
    end
)

vim.keymap.set({ "n", "i", "v" }, "<F4>", function() dap.terminate() end)
vim.keymap.set({ "n", "i", "v" }, "<F10>", function() dap.step_over() end)
vim.keymap.set({ "n", "i", "v" }, "<C-F11>", function() dap.run_to_cursor() end)
vim.keymap.set({ "n", "i", "v" }, "<C-F10>", function() dap.step_back() end)
vim.keymap.set({ "n", "i", "v" }, "<F11>", function() dap.step_into() end)
vim.keymap.set({ "n", "i", "v" }, "<F12>", function() dap.step_out() end)
vim.keymap.set({ "n", "i", "v" }, "<F9>", function() breakpoints.toggle_breakpoint() end)
vim.keymap.set({ "n", "i", "v" }, "<C-F9>", function() breakpoints.set_conditional_breakpoint() end)
vim.keymap.set({ "n" }, "<leader>xb", function() dap.clear_breakpoints() end)
vim.keymap.set({ "n", "i", "v" }, "<S-F9>", function() dap.set_breakpoint(nil, nil, vim.fn.input('[Log message] > ')) end)

-- debugger signs
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'ErrorMsg', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '󱎖', texthl = 'DiffChange', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '󱨧', texthl = 'Directory', linehl = '', numhl = '' })
vim.fn.sign_define(
    "DapStopped",
    {
        text = '',
        texthl = "WarningMsg",
        linehl = "DebugActiveLine",
        numhl = "DebugActiveLine"
    }
)
