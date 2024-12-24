return {
  "AstroNvim/astroui",
  opts = {
    colorscheme = "eldritch",
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {},
    status = {
      separators = {
        breadcrumbs = "  ",
        path = "  ",
      },
      attributes = {
        buffer_active = { bold = false, italic = false },
        diagnostics = { bold = true },
      },
      colors = {
        buffer_overflow_bg = "#2c323c",
      },
    },
  },
}
