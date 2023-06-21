-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require("lsp-zero")
local ih = require("lsp-inlayhints")
local rt = require("rust-tools")
lsp.preset("recommended")

ih.setup()

lsp.ensure_installed({
    "tsserver",
    "rust_analyzer",
    "eslint",
    "pyright",
    "csharp_ls"
    -- "omnisharp",
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = "🚫",
        warn = "⚠️",
        hint = "💡",
        info = "ℹ️",
    },
})

lsp.on_attach(function(client, bufnr)
    ih.on_attach(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.configure("lua_ls", {
    on_attach = function(c, b)
        ih.on_attach(c, b)
    end,
    diagnostics = {
        globals = { "vim" },
    },
})

lsp.configure("sqlls", {
    on_attach = function(c, b)
        require("sqlls").on_attach(c, b)
    end,
})

lsp.configure("yamlls", {
    settings = {
        yaml = {
            keyOrdering = false,
            schemas = {
                ["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/github-workflow.json"] = "./.github/workflow/*.y?aml",
            },
        },
    },
})

lsp.configure("tsserver", {
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
    },
})

lsp.configure("csharp_ls", {
    handlers = {
        ["textDocument/definition"] = require('csharpls_extended').handler,
    },
})

-- lsp.configure("omnisharp", {
--     on_attach = function(client, buffer)
--         client.server_capabilities.semanticTokensProvider.legend = {
--             tokenModifiers = { "static" },
--             tokenTypes = { "comment", "excluded", "identifier", "keyword", "keyword", "number", "operator", "operator",
--                 "preprocessor", "string", "whitespace", "text", "static", "preprocessor", "punctuation", "string",
--                 "string", "class", "delegate", "enum", "interface", "module", "struct", "typeParameter", "field",
--                 "enumMember", "constant", "local", "parameter", "method", "method", "property", "event", "namespace",
--                 "label", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml",
--                 "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "regexp", "regexp", "regexp", "regexp", "regexp",
--                 "regexp", "regexp", "regexp", "regexp" }
--         }
--     end,
--     handlers = {
--         ["textDocument/definition"] = require('omnisharp_extended').handler,
--     },
-- })

rt.setup({
    tools = {
        inlay_hints = {
            auto = true,
        },
    },
})

lsp.configure("pyright", {
    on_attach = function(client, bufnr)
        local util = require("lspconfig/util")
        local path = util.path

        -- From: https://github.com/IceS2/dotfiles/blob/master/nvim/lua/plugins_cfg/mason_ls_and_dap.lua
        local function get_python_path(workspace)
            -- Use activated virtualenv.
            if vim.env.VIRTUAL_ENV or vim.fn.glob(path.join(workspace, ".venv")) then
                local venv_path = vim.env.VIRTUAL_ENV or vim.fn.glob(path.join(workspace, ".venv"))
                return path.join(venv_path, "bin", "python")
            end

            -- Find and use virtualenv in workspace directory.
            for _, pattern in ipairs({ "*", ".*" }) do
                local match = vim.fn.glob(path.join(workspace, pattern, ".python-local"))
                if match ~= "" then
                    return path.join(vim.env.PYENV_ROOT, "versions", path.dirname(match), "bin", "python")
                end
            end

            -- Fallback to system Python.
            return exepath("python3") or exepath("python") or "python"
        end

        local function get_venv(workspace)
            for _, pattern in ipairs({ "*", ".*" }) do
                local match = vim.fn.glob(path.join(workspace, pattern, ".python-local"))
                if match ~= "" then
                    return match
                end
            end
        end

        client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
        -- client.config.settings.venvPath = path.join(vim.env.PYENV_ROOT, "versions")
        -- print(client.config.settings.venvPath)
        -- client.config.settings.venv = get_venv(client.config.root_dir)
    end,
    settings = {
        python = {
            venvPath = ".venv",
            venv = ".",
            disableLanguageServices = true,
            disableOrganizeImports = true,
            analysis = {
                diagnosticMode = "off",
                typeCheckingMode = "off",
                logLevel = "Information",
            },
        },
    },
})

-- vim.lsp.set_log_level("info")
-- lsp.format_mapping("gq", {
--     format_opts = {
--         async = false,
--         timeout_ms = 10000,
--     },
--     servers = {
--         -- ["null-ls"] = { "javascript", "typescript", "lua", "python" },
--     },
-- })

lsp.setup()

----------- Linting---------------------
local null_ls = require("null-ls")
local trouble = require("trouble")

trouble.setup()

-- null_ls.setup({
--     sources = {
--         null_ls.builtins.code_actions.refactoring,
--         null_ls.builtins.completion.spell,
--         null_ls.builtins.formatting.stylua,
--         null_ls.builtins.formatting.isort,
--         null_ls.builtins.diagnostics.eslint,
--         null_ls.builtins.diagnostics.mypy,
--         null_ls.builtins.diagnostics.ruff,
--     },
-- })

require("mason-null-ls").setup({
    ensure_installed = nil,
    automatic_installation = true,
})

vim.diagnostic.config({
    virtual_text = true,
})

-- Restart LSP server
vim.keymap.set("n", "<leader>lrs", vim.cmd.LspRestart, { silent = false })
