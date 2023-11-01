vim.g.mapleader = " "

vim.opt.number = true  -- show line number
vim.opt.relativenumber = true  -- show relative line numbers

vim.opt.mouse = 'a'  -- enable mouse in all modes

vim.opt.ignorecase = true  -- ignore case in searches
vim.opt.smartcase = true  -- ignore uppercase letters unless search term has an uppercase letter
vim.opt.hlsearch = false  -- disable highlighting of previous search

vim.opt.wrap = true  -- create virtual lines to show text of long lines
vim.opt.breakindent = true  -- preserve indentation of a virtual line


vim.opt.tabstop = 2  -- number of spaces for a tab
vim.opt.shiftwidth = 2  -- number of characters a line is indented by nvim
vim.opt.expandtab = true  -- expand tab into spaces

vim.opt.termguicolors = true  -- enable best version of colorscheme

vim.opt.spelllang = "de"
vim.opt.spell = true

-- use function for easy remapping of keys
function map(modes, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    for i = 1, #modes do -- all modes can be put concatenated and are here iterated
      local mode = modes:sub(i,i)
      vim.keymap.set(mode, lhs, rhs, options)
    end
end

-- install and setup the packaging manager
local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
  {'folke/tokyonight.nvim'},
  {'nvim-lualine/lualine.nvim'},
  {'SirVer/ultisnips'},
  {'lervag/vimtex'},
  {"nvim-treesitter/nvim-treesitter"},
  {"nvim-tree/nvim-tree.lua"}, {"nvim-tree/nvim-web-devicons"},

}) 

require('lualine').setup({
  options = {
    icons_enabled = false,
    section_separators = '|',
    component_separators = "-",
  }
})

-- configure colorscheme
vim.cmd.colorscheme('tokyonight')  -- enable colorscheme 'tokyonight' by folke

require('ultisnips')
require("vimtex")
require("treesitter-config")

-- configure nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

