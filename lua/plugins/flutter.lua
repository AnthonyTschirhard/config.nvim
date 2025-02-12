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

    require("flutter-tools").setup({})
    vim.keymap.set("n", "<leader>flr", ":FlutterRun<CR>", { desc = "[Fl]utter [R]un" })
    vim.keymap.set("n", "<leader>fle", ":FlutterEmulators<CR>", { desc = "[Fl]utter [E]mulators" })
    vim.keymap.set("n", "<leader>fld", ":FlutterDevices<CR>", { desc = "[Fl]utter [D]evices" })
    -- vim.keymap.set("n", "<leader>flo", ":FlutterReload<CR>", { desc = "[Fl]utter [R]eload" })
    vim.keymap.set("n", "<leader>fls", ":FlutterRestart<CR>", { desc = "[Fl]utter re[S]tart" })

    require("telescope").load_extension("flutter")
  end,
}
