return {
  "lervag/vimtex",
  lazy = false, -- lazy-loading will disable inverse search
  config = function()
    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
    vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
    -- don't open quickfix menu when compilation succeeds but there are warnings
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_quickfix_ignore_filters = {
      "Underfull",
      "Overfull",
      "LaTeX Warning: .\\+ float specifier changed to",
      "Package hyperref Warning: Token not allowed in a PDF string",
    }
    -- disable vimtex imaps as they are replaced by UltiSnips snippets
    vim.g.vimtex_imaps_enabled = 0
    -- enable VimTeX's PDF viewer inderface
    vim.g.vimtex_view_enabled = 1
    -- use Zathura as the VimTeX PDF viewer
    -- vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_view_method = "zathura_simple"
    -- Always treat subfiles as foot documents (for projects using the subfile package)
    vim.g.vimtex_subfile_start_local = 1
  end,
  keys = {
    { "<localLeader>l", "", desc = "+vimtex", ft = "tex" },
  },
}
