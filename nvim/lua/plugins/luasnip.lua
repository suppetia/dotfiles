return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  build = (not LazyVim.is_win())
      and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
    or nil,
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets/lua" } })
        -- require("luasnip.loaders.from_snipmate").lazy_load({
        --   paths = { vim.fn.stdpath("config") .. "/snippets/snipmate" },
        -- })
      end,
    },
  },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
    update_events = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
  },
  keys = {
    {
      "<Tab>", -- Expand or jump forward
      function()
        local ls = require("luasnip")
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        else
          return "<Tab>"
        end
      end,
      mode = { "i", "s" },
      expr = true,
      silent = true,
      desc = "LuaSnip: Expand or Jump",
    },
    {
      "jk", -- Jump backward
      function()
        local ls = require("luasnip")
        if ls.jumpable(1) then
          ls.jump(1)
        end
      end,
      mode = { "i", "s" },
      silent = true,
      desc = "LuaSnip: Jump Forward",
    },
    {
      "kj", -- Jump backward
      function()
        local ls = require("luasnip")
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end,
      mode = { "i", "s" },
      silent = true,
      desc = "LuaSnip: Jump Backward",
    },
    {
      "<C-l>", -- Cycle choice nodes (next)
      function()
        local ls = require("luasnip")
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end,
      mode = { "i", "s" },
      silent = true,
      desc = "LuaSnip: Choice Next",
    },
    {
      "<C-h>", -- Cycle choice nodes (prev)
      function()
        local ls = require("luasnip")
        if ls.choice_active() then
          ls.change_choice(-1)
        end
      end,
      mode = { "i", "s" },
      silent = true,
      desc = "LuaSnip: Choice Previous",
    },
  },
}
