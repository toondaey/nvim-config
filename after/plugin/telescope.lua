local telescope = require("telescope")
telescope.setup({
    defaults = {
        file_ignore_patterns = { '.git', 'node_modules', 'target', 'obj', 'bin', '.venv' }
    },
    pickers = {
        find_files = {
            -- theme = "ivy",
            mappings = {
                n = {
                        ["cd"] = function(prompt_bufnr)
                        local selection = require("telescope.actions.state").get_selected_entry()
                        local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                        require("telescope.actions").close(prompt_bufnr)
                        -- Depending on what you want put `cd`, `lcd`, `tcd`
                        vim.cmd(string.format("silent lcd %s", dir))
                    end
                }
            }
        }
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            cwd_to_path = true,
        },
        fzf = {
            case_mode = "ignore_case"
        },
        project = {
            base_dirs = {
                { "~/Work",  max_depth = 2 },
                { "~/Tunde", max_depth = 3 }
            }
        },
        frecency = {
            -- theme = 'ivy',
            ignore_patterns = { '*.git/*', '**/node_modules/*', '**/target/*', '**/obj/*', '**/bin/*', '**/.venv/*' }
        },
            ["ui-select"] = {
            -- require("telescope.themes").get_ivy(),
            require("telescope.themes").get_dropdown()
        }
    }
})

telescope.load_extension('fzf')
telescope.load_extension("file_browser")
telescope.load_extension('project')
telescope.load_extension('ui-select')


-- telescope.extensions.file_browser = finder

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ hidden = true }) end, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', builtin.commands, {})
vim.keymap.set('n', '<leader>tb', builtin.treesitter, {})
vim.keymap.set(
    "n",
    "<leader>fd",
    function() telescope.extensions.file_browser.file_browser({ hidden = true }) end,
    { noremap = true }
)
vim.keymap.set(
    "n",
    "<leader>cb",
    function() builtin.current_buffer_fuzzy_find({ skip_empty_lines = true }) end,
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-p>',
    ":lua require'telescope'.extensions.project.project{}<CR>",
    { noremap = true, silent = true }
)
vim.keymap.set(
    "n",
    "<leader><leader>",
    function() telescope.extensions.frecency.frecency({ workspace = 'CWD' }) end,
    { noremap = true, silent = true }
)
