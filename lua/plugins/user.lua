-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
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

  {
    "windwp/nvim-autopairs",
    lazy = true,
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules({
        Rule("$", "$", { "tex", "latex" })
          :with_pair(cond.not_after_regex "%%")
          :with_pair(cond.not_before_regex("xxx", 3))
          :with_move(cond.none())
          :with_del(cond.not_after_regex "xx")
          :with_cr(cond.none()),
      }, Rule("a", "a", "-vim"))
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
        keywords = { italic = true }, -- style for keywords
        identifiers = { italic = false }, -- style for identifiers
        functions = { bold = true }, -- style for functions
        variables = { italic = true }, -- style for variables
      },
      terminal_colors = true, -- enable terminal colors
    },
    config = function(_, opts) require("tokyodark").setup(opts) end,
  },
}
