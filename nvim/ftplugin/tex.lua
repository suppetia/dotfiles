-- remap localleader
vim.g.maplocalleader = " "
-- do some remapping

-- use 'ai' and 'ii' for the item text object
map("ox", "ai", "<Plug>(vimtex-am)")
map("ox", "ii", "<Plug>(vimtex-am)")

-- use 'am' and 'ai' for the inline math text object
map("ox", "am", "<Plug>(vimtex-a$)")
map("ox", "im", "<Plug>(vimtex-i$)")

-- use <localleader>c to trigger continuos compilation
map("n", "<localleader>c", "<Plug>(vimtex-compile)")

-- shortcuts
map("n", "<localleader>v", "<plug>(vimtex-view)")
