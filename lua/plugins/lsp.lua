local lsp = require("lsp-zero").preset({})
local navic = require("nvim-navic")
local lsp_config = require("lspconfig")

lsp.ensure_installed({
    "marksman",
    "bashls",
    "pylsp",
    "jsonls",
    "sqlls",
    "lemminx",
    "yamlls",
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>D", function() vim.diagnostic.goto_prev() end, opts)
    -- in rename.lua -- vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    vim.api.nvim_create_autocmd({ "BufWritePre" }, { buffer = bufnr, callback = function() vim.lsp.buf.format() end })

    if client.server_capabilities.documentSynbolProvider then
        navic.attach(client, bufnr)
    end
end)

-- Fix Undefined global 'vim'
lsp_config.lua_ls.setup(lsp.nvim_lua_ls())

lsp_config.pylsp.setup({
    settings = {
        pylsp = {
            plugins = {
                flake8 = {
                    config = "~/.flake8rc",
                    perFileIgnores = { "./*/__init__.py:F401" },
                }
            }
        }
    }

})

lsp_config.yamlls.setup({
    settings = {
        yaml = {
            validate = true,
            customTags = { "!Ref scalar", "!GetAtt sequence" },
        },
    },
})

lsp.setup()

local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer",  keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
    },
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }
})

vim.diagnostic.config({
    virtual_text = true
})

-- set better diag icons
local signs = {
    Error = " ",
    Warn = " ",
    Hint = "󰌵 ",
    Info = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- toggle inline Diagnostic
local function toggle_inline()
    local current = vim.diagnostic.config().virtual_text

    vim.diagnostic.config({ virtual_text = not current })
end

vim.keymap.set("n", "<leader>dt", toggle_inline)
