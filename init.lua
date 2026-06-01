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
vim.opt.colorcolumn = "90"

local os = require("os")
if os.getenv("TMUX") then
  vim.g.slime_default_config = {
    target_pane = ":.1",
    socket_name = "0",
  }
end
vim.g.slime_no_mappings = true
vim.g.slime_target = "tmux"

vim.g.EditorConfig_exclude_patterns = { "fugitive://.*", "scp://.*" }

require("lazy").setup({
  spec = {
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            vim.o.background = "dark"
            vim.cmd([[colorscheme gruvbox]])
        end,
        priority = 1000,
    },
    { "nvim-tree/nvim-web-devicons" },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
    },
    {
      "akinsho/bufferline.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
    },
    { "junegunn/limelight.vim" },
    { "junegunn/goyo.vim" },
    {
      "nvim-tree/nvim-tree.lua",
      dependencies = "nvim-tree/nvim-web-devicons",
    },
    {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      dependencies = { "nvim-lua/plenary.nvim" },
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

    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- completion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },

    -- use for the git difftool
    {"sindrets/diffview.nvim"},
  },
  checker = {
    enabled = true,
    -- check every 30 days
    frequency = 3600 * 24 * 30,
  },
})
-- }}}
require('lualine').setup({
    options = { theme = "gruvbox" }
})

require("bufferline").setup({
  options = {
    numbers = "buffer_id",
  },
})

require("nvim-tree").setup({})

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "jedi_language_server" },
})

local cmp = require("cmp")

local has_words_before = function()
  local unpack_fn = unpack or table.unpack
  local line, col = unpack_fn(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
  }),
  mapping = {
    ["<C-Space>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),

    ["<Tab>"] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= "prompt" and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,

    ["<S-Tab>"] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= "prompt" and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
  },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- New LSP API: define/override configs with vim.lsp.config(...)
vim.lsp.config("jedi_language_server", {
  capabilities = capabilities,
  before_init = function(_, config)
    local stat = vim.uv.fs_stat("./pyproject.toml")
    if not (stat and stat.type == "file") then
      return
    end

    local result = vim.system({ "poetry", "env", "info", "-p" }, { text = true }):wait()
    if result.code ~= 0 then
      vim.notify(result.stderr or "poetry env info -p failed", vim.log.levels.WARN)
      return
    end

    config.init_options = config.init_options or {}
    config.init_options.workspace = {
      environmentPath = vim.trim(result.stdout) .. "/bin/python",
    }
  end,
})

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
})

-- Enable servers
vim.lsp.enable("jedi_language_server")
vim.lsp.enable("lua_ls")

vim.cmd("abbreviate t NvimTreeOpen")
vim.cmd("abbreviate bdo BufOnly")
vim.cmd("abbreviate ldiffthis Linediff")
vim.cmd("abbreviate ldiffoff LinediffReset")

local builtin = require("telescope.builtin")
local map = vim.keymap.set

map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader>fb", builtin.buffers, {})
map("n", "<leader>fh", builtin.help_tags, {})
map("n", "<leader>ft", builtin.builtin, {})

map("n", "<c-s>", "<Plug>SlimeLineSend", {})
map("x", "<c-s>", "<Plug>SlimeRegionSend", {})

map("n", "gd", vim.lsp.buf.definition, {})
map("n", "gD", vim.lsp.buf.references, {})
map("n", "K", vim.lsp.buf.hover, {})
