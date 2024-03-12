vim.keymap.set('n', '<C-u>', vim.cmd.UndotreeToggle)
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.g.undotree_WindowLayout = 4
vim.g.undotree_SplitWidth = 40
