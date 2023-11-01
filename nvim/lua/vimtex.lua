-- disable vimtex imaps as they are replaced by UltiSnips snippets
vim.g.vimtex_imaps_enabled = 0
-- don't open quickfix menu when compilation succeeds but there are warnings
vim.g.vimtex_quickfix_open_on_warning = 0

-- enable VimTeX's PDF viewer inderface
vim.g.vimtex_view_enabled = 1
-- use Zathura as the VimTeX PDF viewer
vim.g.vimtex_view_method = "zathura"

