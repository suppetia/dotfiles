-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.maplocalleader = ","

local opt = vim.opt

opt.smoothscroll = false
opt.wrap = true -- enable line wrap
opt.breakindent = true -- preserve indentation of a virtual line

opt.spell = true
opt.spelllang = { "en", "de" }
