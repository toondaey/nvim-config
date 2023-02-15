require('catppuccin').setup({
    flavour = 'mocha',
    transparent_background = false,
    integrations = {
        barbecue = {
            dim_dirname = true,
        },
        mason = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
    }
})

require("barbecue").setup {
  theme = "catppuccin",
}

-- You NEED to enable highlight in nvim-navic setting or it won't work
require("nvim-navic").setup {
    highlight = true
}

vim.g.airline_theme = 'catppuccin'
