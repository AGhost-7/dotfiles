-- {{{ Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
-- }}}

vim.opt.foldmethod = "marker"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

local os = require('os')
if os.getenv("TMUX") then
  vim.g.slime_default_config = {
    target_pane = ":.1",
    socket_name = "0"
  }
end
vim.g.slime_no_mappings = true
vim.g.slime_target = "tmux"

-- skip certain file types
vim.g.EditorConfig_exclude_patterns = {"fugitive://.*", "scp://.*"}

-- {{{ configure plugins
require("lazy").setup({
  spec = {
    -- color theme
    {
        "morhetz/gruvbox",
        config = function()
            vim.cmd([[colorscheme gruvbox]])
        end,
        priority = 1000,
    },
    {'nvim-tree/nvim-web-devicons'},
    -- bottom status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
    },
    -- top status line
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
    },
    -- dims code
    {"junegunn/limelight.vim"},
    -- minimalist mode
    {'junegunn/goyo.vim'},
    -- file tree browser
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = "nvim-tree/nvim-web-devicons",
    },
    -- file finder and much more
    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        dependencies = {"nvim-lua/plenary.nvim"},
    },
    -- partial file diffs
    {"AndrewRadev/linediff.vim"},
    -- terminal integration
    {"jpalardy/vim-slime"},
    -- project-specific editor configuration
    {"editorconfig/editorconfig-vim"},
    -- Adds the ability to close all except the current buffer
    {"vim-scripts/BufOnly.vim"},
    -- Allows you to run git commands from vim
    {"tpope/vim-fugitive"},
    -- Github integration for fugitive
    {"tpope/vim-rhubarb"},
    -- browse file history
    {"junegunn/gv.vim"},
    -- git integration
    {'tpope/vim-fugitive'},
    -- Github integration for fugitive
    {'tpope/vim-rhubarb'},
  },
  checker = { enabled = true },
})
--- }}}
require('lualine').setup({
    options = { theme = "gruvbox" }
})
require('bufferline').setup({
  options = {
    numbers = "buffer_id"
  }
})
require("nvim-tree").setup({})


vim.cmd('abbreviate t NvimTreeOpen')
vim.cmd('abbreviate bdo BufOnly')
vim.cmd('abbreviate ldiffthis Linediff')
vim.cmd('abbreviate ldiffoff LinediffReset')

local builtin = require('telescope.builtin')
local map = vim.keymap.set

map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})
map('n', '<leader>ft', builtin.builtin, {})

map('n', '<c-s>', '<Plug>SlimeLineSend', {})
map('x', '<c-s>', '<Plug>SlimeRegionSend', {})

map('n', 'gd', vim.lsp.buf.definition, {})
map('n', 'gD', vim.lsp.buf.references, {})
map('n', 'K', vim.lsp.buf.hover, {})
