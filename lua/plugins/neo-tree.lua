return {
  "nvim-neo-tree/neo-tree.nvim",
  -- opts = {
  --   filesystem = {
  --     bind_to_cwd = false,
  --     follow_current_file = false,
  --     filtered_items = {
  --       hide_dotfiles = false,
  --       hide_gitignored = true,
  --       hide_by_name = {
  --         ".DS_Store",
  --         "thumbs.db",
  --         "node_modules",
  --         ".github",
  --         ".gitignore",
  --         "package-lock.json",
  --         ".changeset",
  --         ".prettierrc.json",
  --         ".commandkit",
  --       },
  --       never_show = { ".git" },
  --     },
  --   },
  -- },
  keys = {
    {
      "<leader>e",
      function()
        local buf_name = vim.api.nvim_buf_get_name(0)
        -- Function to check if NeoTree is open in any window
        local function is_neo_tree_open()
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].filetype == "neo-tree" then return true end
          end
          return false
        end
        -- Check if the current file exists
        if vim.fn.filereadable(buf_name) == 1 or vim.fn.isdirectory(vim.fn.fnamemodify(buf_name, ":p:h")) == 1 then
          if is_neo_tree_open() then
            -- Close NeoTree if it's open
            vim.cmd "Neotree close"
          else
            -- Open NeoTree and reveal the current file
            vim.cmd "Neotree reveal"
          end
        else
          -- If the file doesn't exist, execute the logic for <leader>R
          require("neo-tree.command").execute { toggle = true, dir = vim.uv.cwd() }
        end
      end,
      desc = "Toggle NeoTree",
    },
    {
      "<leader>E",
      function() require("neo-tree.command").execute { toggle = true, dir = vim.uv.cwd() } end,
      desc = "Explorer NeoTree (cwd)",
    },
  },
}
