return {
  {
    "nvim-neo-tree/neo-tree.nvim",
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
    enabled = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeFindFileToggle", "NvimTree", "NvimTreeOpen", "NvimTreeToggle", "NvimTreeFocus", "NvimTreeClose" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "󰙅 Explorer" },
    },
    opts = function()
      local icons = require "icons"
      return {
        disable_netrw = false,
        hijack_cursor = true,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        view = {
          adaptive_size = false,
          centralize_selection = true,
          width = 30,
          side = "left",
          preserve_window_proportions = false,
          number = false,
          relativenumber = false,
          signcolumn = "no",
          float = {
            enable = false,
            quit_on_focus_loss = true,
            open_win_config = {
              relative = "editor",
              border = "rounded",
              width = 30,
              height = 30,
              row = 1,
              col = 1,
            },
          },
        },
        renderer = {
          root_folder_label = false,
          highlight_git = true,
          indent_markers = { enable = true },
          icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
            glyphs = {
              default = icons.ui.Text,
              symlink = icons.ui.FileSymlink,
              bookmark = icons.ui.BookMark,
              folder = {
                arrow_closed = icons.ui.ChevronShortRight,
                arrow_open = icons.ui.ChevronShortDown,
                default = icons.ui.Folder,
                open = icons.ui.FolderOpen,
                empty = icons.ui.EmptyFolder,
                empty_open = icons.ui.EmptyFolderOpen,
                symlink = icons.ui.FolderSymlink,
                symlink_open = icons.ui.FolderOpen,
              },
              git = {
                unstaged = icons.git.FileUnstaged,
                staged = icons.git.FileStaged,
                unmerged = icons.git.FileUnmerged,
                renamed = icons.git.FileRenamed,
                untracked = icons.git.FileUntracked,
                deleted = icons.git.FileDeleted,
                ignored = icons.git.FileIgnored,
              },
            },
          },
          special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
          symlink_destination = true,
        },
        filters = {
          dotfiles = false,
          git_clean = false,
          no_buffer = false,
          custom = { "node_modules", "\\.cache", "\\.git" },
          exclude = {
            ".gitignore",
            ".prettierignore",
          },
        },
        notify = {
          threshold = vim.log.levels.INFO,
        },
        git = {
          enable = true,
          ignore = false,
          show_on_dirs = true,
          show_on_open_dirs = true,
          disable_for_dirs = {},
          timeout = 400,
        },
      }
    end,
    config = function(_, opts) require("nvim-tree").setup(opts) end,
  },
}
