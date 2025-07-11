return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  { 
  'gen740/SmoothCursor.nvim',
  config = function()
    require('smoothcursor').setup()
  end
  },
  {
  'windwp/nvim-ts-autotag',
  config = function()
    require('nvim-ts-autotag').setup({
      filetypes = {
        'html', 'javascript', 'typescript', 'javascriptreact', 
        'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'php', 'blade',
      },
      skip_tags = {
        'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'input',
        'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr', 'menuitem'
      },
    })
  end
  }, 
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
   "nvim-lua/plenary.nvim",
 { "nvim-tree/nvim-web-devicons", lazy = true },

 {
   "nvchad/ui",
    config = function()
      require "nvchad" 
    end
 },

 {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
 },

 {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
 },
 {
  "echasnovski/mini.surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("mini.surround").setup({
      mappings = {
        add = 'sa',         -- Add surrounding
        delete = 'sd',      -- Delete surrounding
        replace = 'sr',     -- Replace surrounding
        find = 'sf',        -- Find to the right
        find_left = 'sF',   -- Find to the left
        highlight = 'sh',   -- Highlight surrounding
        update_n_lines = 'sn',
        suffix_last = 'l',
        suffix_next = 'n',
      }
    })
  end,
},
 "nvchad/volt", -- optional, needed for theme switcher
 -- or just use Telescope themes 
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
