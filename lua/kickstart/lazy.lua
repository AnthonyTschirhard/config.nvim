-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'folke/tokyonight.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'numToStr/Comment.nvim',    opts = {} },
  {                   -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Which Key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  -- navigation
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'barrett-ruth/telescope-http.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  {
    'wintermute-cell/gitignore.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  {
    'AckslD/nvim-neoclip.lua',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  { 'raimon49/requirements.txt.vim' },
  'norcalli/nvim-colorizer.lua',

  -- file explorer
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- code highlight/completion
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'folke/neodev.nvim',
  'liuchengxu/graphviz.vim',
  'Vimjas/vim-python-pep8-indent',
  'jidn/vim-dbml',
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      {
        'neovim/nvim-lspconfig',
        dependencies = {
          {
            'SmiteshP/nvim-navbuddy',
            dependencies = {
              'SmiteshP/nvim-navic',
              'MunifTanjim/nui.nvim',
            },
            opts = { lsp = { auto_attach = true } }
          },
        },
      },
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'SmiteshP/nvim-navic',
    },
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    'someone-stole-my-name/yaml-companion.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },
  -- text editing
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   ---@type Flash.Config
  --   opts = {}
  -- },
  'mbbill/undotree',
  'mg979/vim-visual-multi',
  'dhruvasagar/vim-table-mode',
  'junegunn/vim-easy-align',
  'numToStr/Comment.nvim',
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    "danymat/neogen",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },

  -- visual information
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  'lukas-reineke/virt-column.nvim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'startup-nvim/startup.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
  },
  'mechatroner/rainbow_csv',
  'rcarriga/nvim-notify',
  'lukas-reineke/indent-blankline.nvim',
  'petertriho/nvim-scrollbar',

  -- debugging & testing
  { "nvim-neotest/nvim-nio" },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
  },
  'mfussenegger/nvim-dap-python',
  'Weissle/persistent-breakpoints.nvim',
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      --"nvim-treesitter/nvim-treesitter",
      'antoinemadec/FixCursorHold.nvim',
      'nvim-neotest/neotest-python',
    },
  },
  {
    'andythigpen/nvim-coverage',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'folke/trouble.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  -- version control
  'tpope/vim-fugitive',
  'tveskag/nvim-blame-line',
  -- tasks
  {
    'stevearc/overseer.nvim',
    opts = {},
  },
  -- terminal
  'fcusson/toggleterm.nvim',
  'edluffy/hologram.nvim',
  -- database
  {
    'tpope/vim-dadbod',
    dependencies = {
      'kristijanhusak/vim-dadbod-ui',
      'kristijanhusak/vim-dadbod-completion',
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  },

  -- schema store
  "b0o/schemastore.nvim",

  -- TMUX
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- AWS
  { 'kiran94/s3edit.nvim',  config = true, cmd = "S3Edit" },
}
