-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
local ih = require("inlay-hints")
lsp.preset('recommended')

ih.setup()

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'eslint',
    'pyright',
    'omnisharp',
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrl", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    ih.on_attach(client, bufnr)
end)

lsp.configure('lua_ls', {
    on_attach = function(c, b)
        ih.on_attach(c, b)
    end,
    {
        diagnostics = {
            globals = { "vim" }
        }
    }
})

lsp.configure('tsserver', {
    on_attach = function(c, b)
        ih.on_attach(c, b)
    end
})
lsp.configure('rust_analyzer', {
    on_attach = function(c, b)
        ih.on_attach(c, b)
    end
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

-- Restart LSP server
vim.keymap.set("n", "<leader>lrs", vim.cmd.LspRestart, { silent = false })
