return {
  "SmiteshP/nvim-navic",
  event = "VeryLazy",
  config = function()
    local icons = require("icons").kind
    for key, value in pairs(icons) do
      icons[key] = value .. " "
    end
    require("nvim-navic").setup {
      icons = icons,
      lsp = {
        auto_attach = false,
        preference = nil,
      },
      highlight = false,
      separator = " > ",
      depth_limit = 0,
      depth_limit_indicator = "..",
      safe_output = true,
      lazy_update_context = false,
      click = false,
      format_text = function(text) return text end,
    }
  end,

  -- dependencies = {
  --   "LunarVim/breadcrumbs.nvim",
  --   opts = {},
  --   config = true,
  -- },
  -- enabled = false,
}
