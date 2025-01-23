return {

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  { "nyoom-engineering/oxocarbon.nvim", lazy = true },
  {
    "CosecSecCot/midnight-desert.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      transparent_background = false, -- set background to transparent
      gamma = 1.00, -- adjust the brightness of the theme
      styles = {
        comments = { italic = false }, -- style for comments
        keywords = { italic = false }, -- style for keywords
        identifiers = { italic = false }, -- style for identifiers
        functions = { bold = false }, -- style for functions
        variables = { italic = false }, -- style for variables
      },
      terminal_colors = true, -- enable terminal colors
    },
    config = function(_, opts) require("tokyodark").setup(opts) end,
  },
}
