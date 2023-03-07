-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
-- local ih = require("inlay-hints")
local ih = require('lsp-inlayhints')
local rt = require("rust-tools")
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
        error = '🚫',
        warn = '⚠️',
        hint = '💡',
        info = 'ℹ️'
    }
})

lsp.configure('lua_ls', {
    on_attach = function(c, b)
        ih.on_attach(c, b)
    end,
    diagnostics = {
        globals = { "vim" }
    }
})

lsp.configure('tsserver', {
    on_attach = function(c, b)
        ih.on_attach(c, b)
    end,
    settings = {
        typescript = {
            inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
            },
        },
    }
})

rt.setup({
    tools = {
        inlay_hints = {
            auto = true
        }
    }
})

lsp.configure('pyright', {
    on_attach = function(c, b)
        ih.on_attach(c, b)
    end
})

lsp.configure('pylsp', {
    on_attach = function(c, b) ih.on_attach(c, b) end,
    settings = {
        pylsp = {
            plugins = {
                black = { enabled = true },
                isort = { enabled = true },
                mypy = { enabled = true },
                pycodestyle = { enabled = false },
                mccabe = { enabled = false },
                ruff = { enabled = true }
            }
        }
    }
})

-- lsp.skip_server_setup({ 'pyright' })

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

-- Restart LSP server
vim.keymap.set("n", "<leader>lrs", vim.cmd.LspRestart, { silent = false })
