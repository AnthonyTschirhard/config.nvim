local lualine = require('lualine')
local radon_result = nil

local function session_name()
    return require('possession.session').session_name or ''
end

local function get_radon_mi_score_async(filepath, callback)
    local stdout = vim.loop.new_pipe(false)
    local stderr = vim.loop.new_pipe(false)
    local handle
    handle = vim.loop.spawn('radon', {
        args = { 'mi', '-s', filepath },
        stdio = { nil, stdout, stderr }
    }, function(code)
        stdout:read_stop()
        stderr:read_stop()
        stdout:close()
        stderr:close()
        handle:close()
        if code ~= 0 then
            callback(nil)
        end
    end)
    local result = {}
    stdout:read_start(function(err, data)
        if err then
            stdout:read_stop()
            stderr:read_stop()
            stdout:close()
            stderr:close()
            handle:close()
            callback(nil)
        end
        if data then
            table.insert(result, data)
        else
            callback(table.concat(result))
        end
    end)
end

local function radon_score()
    if vim.bo.filetype ~= "python" then
        return ""
    end

    local current_file = vim.fn.expand("%")

    get_radon_mi_score_async(
        current_file,
        function(result)
            if type(result) == "string" then
                radon_result = string.match(result, "%u [(]%d+[.]%d+[)]")
            else
                radon_result = ""
            end
        end
    )


    return radon_result or ""
end

local function radon_color()
    local result = radon_result or ""
    local color = "#f8f8f2"

    local radon_letter = string.match(result, "%u")

    if radon_letter == "A" then
        color = "#50fa7b"
    elseif radon_letter == "B" then
        color = "#f1fa8c"
    elseif radon_letter == "C" or radon_letter == "D" then
        color = "#ffb86c"
    elseif radon_letter == "E" or radon_letter == "F" then
        color = "#ff5555"
    end

    return { fg = color }
end

local ignore = {
    "startup",
    "NvimTree",
    "neotest-summary",
    "qf",
    "minimap",
    "dap-repl",
}

local no_focus = {
    "undotree",
    "diff",
    "dapui_stacks",
    "dapui_breakpoints",
    "dapui_scopes",
    "db_ui",
}

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'dracula',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = ignore,
            winbar = ignore,
        },
        ignore_focus = no_focus,
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            'branch',
            'diff',
            'diagnostics',
            {
                radon_score,
                color = function(section) return radon_color() end,
            }
        },
        lualine_c = { 'filename', session_name },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
