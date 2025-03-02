-- Build flutter and dart applications in neovim using the native LSP
-- https://github.com/nvim-flutter/flutter-tools.nvim
return {
  "nvim-flutter/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  config = function()
    --
    -- alternatively you can override the default configs

    require("flutter-tools").setup({
      debugger = {
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
        register_configurations = function(paths)
          local dap = require("dap")
          -- See also: https://github.com/akinsho/flutter-tools.nvim/pull/292
          dap.adapters.dart = {
            type = "executable",
            command = paths.flutter_bin,
            args = { "debug-adapter" },
          }
          dap.configurations.dart = {
            {
              type = "dart",
              request = "launch",
              name = "Launch Dart Program",
              program = "${workspaceFolder}/lib/main.dart",
              cwd = "${workspaceFolder}",
            },
          }
        end,
      },
    })

    require("telescope").load_extension("flutter")

    vim.keymap.set("n", "<leader>flr", ":FlutterRun --no-enable-impeller<CR>", { desc = "[Fl]utter [R]un" })
    vim.keymap.set("n", "<leader>fle", ":FlutterEmulators<CR>", { desc = "[Fl]utter [E]mulators" })
    vim.keymap.set("n", "<leader>fld", ":FlutterDevices<CR>", { desc = "[Fl]utter [D]evices" })
    vim.keymap.set("n", "<leader>fls", ":FlutterRestart<CR>", { desc = "[Fl]utter re[S]tart" })
    vim.keymap.set("n", "<leader>flq", ":FlutterQuit<CR>", { desc = "[Fl]utter [Q]uit" })
    vim.keymap.set("n", "<leader>flc", ":Telescope flutter commands<CR>", { desc = "[Fl]utter [C]ommands" })
  end,
}
