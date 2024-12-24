return {
  {
    "nvim-lualine/lualine.nvim",
    event = { "InsertEnter", "BufRead", "BufNewFile" },
    dependencies = {
      { "pojokcodeid/auto-lualine.nvim" },
      {
        "AstroNvim/astroui",
        opts = {
          icons = {
            Clock = "",
          },
        },
      },
    },
    config = function()
      local lualine = require "auto-lualine"
      local status = require "astroui.status"
      lualine.setup {
        setColor = "auto",
        setOption = "triangle",
        setMode = 3,
      }
      require("lualine").setup {
        sections = {
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              local time = os.date "%H:%M" -- show hour and minute in 24 hour format
              ---@cast time string
              return status.utils.stylize(time, {
                icon = { kind = "Clock", padding = { right = 1 } }, -- add icon
                padding = { right = 1 }, -- pad the right side
              })
            end,
          },
        },
      }
      local uv = vim.uv or vim.loop
      uv.new_timer():start( -- timer for updating the time
        (60 - tonumber(os.date "%S")) * 1000, -- offset timer based on current seconds past the minute
        60000, -- update every 60 seconds
        vim.schedule_wrap(
          function() vim.api.nvim_exec_autocmds("User", { pattern = "UpdateTime", modeline = false }) end
        )
      )
    end,
    specs = {
      {
        "rebelot/heirline.nvim",
        optional = true,
        opts = function(_, opts) opts.statusline = nil end,
      },
    },
  },
}
