return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      -- 1. Disable the default "s" and "S" mapping
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "x", "o" }, false },

      -- 2. Bind Flash to another key, e.g., "S"
      --    (Note: "S" is usually 'cc' (change line) or 'flash treesitter' in LazyVim default)
      {
        "<leader>s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },

      -- Optional: If you mapped Flash to "S", you might want to move the
      -- default "Flash Treesitter" (which was on "S") to something else, e.g., "<leader>S"
      {
        "<leader>S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
}
