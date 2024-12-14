return {
  "HiPhish/rainbow-delimiters.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>ur"] = {
              function()
                require("rainbow-delimiters").toggle(0)
                require("astrocore").notify(
                  string.format(
                    "Buffer rainbow delimeters %s",
                    require("rainbow-delimiters.lib").buffers[vim.api.nvim_get_current_buf()] and "on" or "off"
                  )
                )
              end,
              desc = "Toggle rainbow delimeters (buffer)",
            },
          },
        },
      },
    },
  },
  lazy = true,
  event = "User AstroFile",
  main = "rainbow-delimiters.setup",
  opts = {
    blacklist = {
      "html",
    },
  },
  config = function()
    -- Modul ini berisi beberapa definisi default
    local rainbow_delimiters = require "rainbow-delimiters"
    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
      },
      priority = {
        [""] = 110,
        lua = 210,
      },
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
      blacklist = {
        "html",
        "tsx",
      },
    }
  end,
}
