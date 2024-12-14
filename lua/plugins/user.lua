-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "██╗  ██╗██╗███╗   ██╗██╗  ██╗███████╗███╗   ██╗",
        "██║ ██╔╝██║████╗  ██║██║ ██╔╝██╔════╝████╗  ██║",
        "█████╔╝ ██║██╔██╗ ██║█████╔╝ █████╗  ██╔██╗ ██║",
        "██╔═██╗ ██║██║╚██╗██║██╔═██╗ ██╔══╝  ██║╚██╗██║",
        "██║  ██╗██║██║ ╚████║██║  ██╗███████╗██║ ╚████║",
        "╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝",
      }
      opts.section.buttons.val = {
        opts.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
        opts.button("b", "  > Browse files", ":Oil --float<CR>"),
        opts.button("f", "󰈞  > Find file", ":Telescope find_files<CR>"),
        opts.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
      }
      return opts
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    lazy = true,
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false,
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'", "`" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      },
    },
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
}
