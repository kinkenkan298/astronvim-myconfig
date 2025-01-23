return {
  {
    "folke/noice.nvim",
    lazy = true,
    enabled = true,
    dependencies = {
      { "MunifTanjim/nui.nvim" },
    },
    event = "CmdlineEnter",
    opts = {
      messages = {
        enabled = true,
      },
      notify = {
        enabled = false,
      },
      lsp = {
        progress = {
          enabled = false,
        },
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
      },
    },
  },
  {
    "Saghen/blink.cmp",
    dependencies = {
      {
        "giuxtaposition/blink-cmp-copilot",
        enabled = true,
      },
    },
    opts = {
      completion = {
        list = { selection = { preselect = true, auto_insert = true } },
      },
      sources = {
        -- default = { "lsp", "path", "snippets", "buffer", "copilot" },
        -- providers = {
        --   copilot = {
        --     name = "copilot",
        --     module = "blink-cmp-copilot",
        --     score_offset = 100,
        --     async = true,
        --   },
        -- },
      },
    },
  },
  {
    "copilot.lua",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
    enabled = false,
  },
}
