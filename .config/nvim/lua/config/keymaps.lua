-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set(
  "n",
  "<localLeader>L",
  '<Cmd>lua require("luasnip.loaders.from_lua").load({ paths = { vim.fn.stdpath("config") .. "/snippets/lua" } })<CR>'
)
