vim.keymap.set("n", "<leader>du", vim.cmd.DBUIToggle)
vim.keymap.set("n", "<leader>df", vim.cmd.DBUIFindBuffer)
vim.keymap.set("n", "<leader>dr", vim.cmd.DBUIRenameBuffer)
vim.keymap.set("n", "<leader>dl", vim.cmd.DBUILastQueryInfo)
vim.g.db_ui_save_location = '~/.config/db_ui'
