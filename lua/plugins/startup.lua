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
            "           __                                ",
            ".-.__      \\ .-.  ___  __                    ",
            "|_|  '--.-.-(   \\/\\;;\\_\\.-._______.-.        ",
            "(-)___     \\ \\ .-\\ \\;;\\(   \\       \\ \\       ",
            " Y    '---._\\_((Q)) \\;;\\\\ .-\\     __(_)      ",
            " I           __'-' / .--.((Q))---'    \\,     ",
            " I     ___.-:    \\|  |   \\'-'_          \\    ",
            " A  .-'      \\ .-.\\   \\   \\ \\ '--.__     '\\  ",
            " |  |____.----((Q))\\   \\__|--\\_      \\     ' ",
            "    ( )        '-'  \\_  :  \\-' '--.___\\      ",
            "     Y                \\  \\  \\       \\(_)     ",
            "     I                 \\  \\  \\         \\,    ",
            "     I                  \\  \\  \\          \\   ",
            "     A                   \\  \\  \\          '\\ ",
            "     |                    \\  \\__|           '",
            "                           \\_:.  \\           ",
            "                             \\ \\  \\          ",
            "                              \\ \\  \\         ",
            "                               \\_\\_|         "
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
                "<leader>sf"
            },
            {
                " Find Word",
                "Telescope live_grep",
                "<leader>sg"
            },
            {
                " Recent Files",
                "Telescope oldfiles",
                "<leader>s."
            },
            {
                " File Browser",
                "NvimTreeFocus",
                "<leader>pc"
            },
            {
                " Colorschemes",
                "Telescope colorscheme",
                "<leader>ft"
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
-- * powerline_extra:                                         
-- * font_awesome:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
-- * font_awesome_extensions:                                                                                                                                                                          
-- * material_design_icons:                                                                                                                                                                                                      
-- * weather_icons:                                                                                                                                                                                                                                     摒 敖 晴 朗 望 杖 歹 殺 流 滛 滋 漢 瀞 煮 瞧
-- * devicons:                                                                                                                                                                                                      
-- * octicons:                                                                                                                                                                           
-- * font_logos:                    
-- * pomicons:           
-- * iec_power: ⏻ ⏼ ⏽ ⏾ ⭘
-- * seti_ui:                                                     
-- */
