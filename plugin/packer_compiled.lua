-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/babatunde.aromire@cognitedata.com/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/babatunde.aromire@cognitedata.com/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/babatunde.aromire@cognitedata.com/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/babatunde.aromire@cognitedata.com/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/babatunde.aromire@cognitedata.com/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["autoclose.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/autoclose.nvim",
    url = "https://github.com/m4xshen/autoclose.nvim"
  },
  ["barbecue.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rbarbecue\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/opt/barbecue.nvim",
    url = "https://github.com/utilyre/barbecue.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["competitest.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16competitest\frequire\0" },
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/competitest.nvim",
    url = "https://github.com/xeluxee/competitest.nvim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14dashboard\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/opt/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["denite.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/denite.nvim",
    url = "https://github.com/Shougo/denite.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git-conflict.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17git-conflict\frequire\0" },
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["lsp-inlayhints.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/lsp-inlayhints.nvim",
    url = "https://github.com/lvimuser/lsp-inlayhints.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["npm.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/npm.nvim",
    url = "https://github.com/neoclide/npm.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ufo"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["peek.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/peek.nvim",
    url = "https://github.com/toppair/peek.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["rest.nvim"] = {
    config = { "\27LJ\2\n>\0\1\5\0\4\0\0066\1\0\0009\1\1\0019\1\2\0015\3\3\0\18\4\0\0D\1\3\0\1\5\0\0\ttidy\a-i\a-q\6-\vsystem\afn\bvimî\2\1\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0003\5\b\0=\5\t\4=\4\n\3=\3\v\0024\3\0\0=\3\f\2B\0\2\1K\0\1\0\29custom_dynamic_variables\vresult\15formatters\thtml\0\1\0\1\tjson\ajq\1\0\3\rshow_url\2\17show_headers\2\19show_http_info\2\14highlight\1\0\2\ftimeout\3–\1\fenabled\2\1\0\a\20jump_to_request\1\26skip_ssl_verification\1\renv_file\t.env\17yank_dry_run\2\15encode_url\2\26result_split_in_place\1\28result_split_horizontal\1\nsetup\14rest-nvim\frequire\0" },
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/rest.nvim",
    url = "https://github.com/rest-nvim/rest.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["smartcolumn.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/smartcolumn.nvim",
    url = "https://github.com/m4xshen/smartcolumn.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/kkharji/sqlite.lua"
  },
  ["statuscol.nvim"] = {
    config = { "\27LJ\2\nW\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\vsetopt\2\rfoldfunc\fbuiltin\nsetup\14statuscol\frequire\0" },
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/statuscol.nvim",
    url = "https://github.com/luukvbaal/statuscol.nvim"
  },
  tagbar = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/preservim/tagbar"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vgit.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/vgit.nvim",
    url = "https://github.com/tanvirtin/vgit.nvim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
  },
  ["vim-cargo"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/vim-cargo",
    url = "https://github.com/timonv/vim-cargo"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  vimspector = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/vimspector",
    url = "https://github.com/puremourning/vimspector"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/Users/babatunde.aromire@cognitedata.com/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: git-conflict.nvim
time([[Config for git-conflict.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17git-conflict\frequire\0", "config", "git-conflict.nvim")
time([[Config for git-conflict.nvim]], false)
-- Config for: rest.nvim
time([[Config for rest.nvim]], true)
try_loadstring("\27LJ\2\n>\0\1\5\0\4\0\0066\1\0\0009\1\1\0019\1\2\0015\3\3\0\18\4\0\0D\1\3\0\1\5\0\0\ttidy\a-i\a-q\6-\vsystem\afn\bvimî\2\1\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0003\5\b\0=\5\t\4=\4\n\3=\3\v\0024\3\0\0=\3\f\2B\0\2\1K\0\1\0\29custom_dynamic_variables\vresult\15formatters\thtml\0\1\0\1\tjson\ajq\1\0\3\rshow_url\2\17show_headers\2\19show_http_info\2\14highlight\1\0\2\ftimeout\3–\1\fenabled\2\1\0\a\20jump_to_request\1\26skip_ssl_verification\1\renv_file\t.env\17yank_dry_run\2\15encode_url\2\26result_split_in_place\1\28result_split_horizontal\1\nsetup\14rest-nvim\frequire\0", "config", "rest.nvim")
time([[Config for rest.nvim]], false)
-- Config for: statuscol.nvim
time([[Config for statuscol.nvim]], true)
try_loadstring("\27LJ\2\nW\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\vsetopt\2\rfoldfunc\fbuiltin\nsetup\14statuscol\frequire\0", "config", "statuscol.nvim")
time([[Config for statuscol.nvim]], false)
-- Config for: competitest.nvim
time([[Config for competitest.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16competitest\frequire\0", "config", "competitest.nvim")
time([[Config for competitest.nvim]], false)
-- Config for: telescope-frecency.nvim
time([[Config for telescope-frecency.nvim]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0", "config", "telescope-frecency.nvim")
time([[Config for telescope-frecency.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-web-devicons ]]
vim.cmd [[ packadd barbecue.nvim ]]

-- Config for: barbecue.nvim
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rbarbecue\frequire\0", "config", "barbecue.nvim")

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'dashboard-nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
