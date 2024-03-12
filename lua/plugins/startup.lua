local startup = require("startup")

startup.setup({
    -- every line should be same width without escaped \
    header = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = {
            [[________/\\\\\__/\\\________/\\\___________________________        ]],
            [[ ______/\\\///__\/\\\_______\/\\\___________________________       ]],
            [[  _____/\\\______\//\\\______/\\\___/\\\_____________________      ]],
            [[   __/\\\\\\\\\____\//\\\____/\\\___\///_____/\\\\\__/\\\\\___     ]],
            [[    _\////\\\//______\//\\\__/\\\_____/\\\__/\\\///\\\\\///\\\_    ]],
            [[     ____\/\\\_________\//\\\/\\\_____\/\\\_\/\\\_\//\\\__\/\\\_   ]],
            [[      ____\/\\\__________\//\\\\\______\/\\\_\/\\\__\/\\\__\/\\\_  ]],
            [[       ____\/\\\___________\//\\\_______\/\\\_\/\\\__\/\\\__\/\\\_ ]],
            [[        ____\///_____________\///________\///__\///___\///___\///__]],


        },
        highlight = "Statement",
        default_color = "",
        oldfiles_amount = 0,
    },
    -- name which will be displayed and command
    body = {
        type = "mapping",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = 5,
        content = {
            {
                " Find File",
                "Telescope find_files hidden=true no_ignore=true no_ignore_parent=true",
                "<leader>pf"
            },
            {
                " Find Word",
                "Telescope live_grep",
                "<leader>ps"
            },
            {
                " Recent Files",
                "Telescope oldfiles",
                "<leader>of"
            },
            {
                " File Browser",
                "NvimTreeFocus",
                "<leader>pv"
            },
            {
                " Colorschemes",
                "Telescope colorscheme",
                "<leader>cs"
            },
            {
                " New File",
                "lua require'startup'.new_file()",
                "<leader>nf"
            },
        },
        highlight = "String",
        default_color = "",
        oldfiles_amount = 0,
    },
    footer = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Footer",
        margin = 5,
        content = { "startup.nvim" },
        highlight = "Number",
        default_color = "",
        oldfiles_amount = 0,
    },

    options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 3, 3, 0 },
    },
    mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<TAB>",
        open_help = "?",
    },
    colors = {
        background = "#1f2227",
        folded_section = "#56b6c2",
    },
    parts = { "header", "body", "footer" },

})
