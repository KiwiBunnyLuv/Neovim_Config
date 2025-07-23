return {
-- Colorscheme
  {
   "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {}, 
},

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
 },

   {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      
      wk.setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
            suggestions = 20,
          },
          presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
          },
        },
      })

      -- Enregistrer vos propres raccourcis
      wk.register({
        ["<leader>"] = {
          f = {
            name = "File", -- groupe de raccourcis
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
            n = { "<cmd>enew<cr>", "New File" },
          },
          w = { "<cmd>w<CR>", "Save" },
          q = { "<cmd>q<CR>", "Quit" },
          e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
          x = {
            name = "Diagnostics",
            x = { "<cmd>Trouble<cr>", "Trouble" },
            w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace" },
            d = { "<cmd>Trouble document_diagnostics<cr>", "Document" },
          },
          s = {
            name = "Search",
            g = { "<cmd>Telescope live_grep<cr>", "Grep" },
            b = { "<cmd>Telescope buffers<cr>", "Buffers" },
          },
        },
      })
    end,
  },
 }
