require("nvchad.configs.lspconfig").defaults() local servers = {'lua_ls', "html", "intelephense" ,"cssls", 'ts_ls', 'tailwindcss', "emmet_ls"}
vim.lsp.enable(servers)
local lspconfig = require('lspconfig')

local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

require("lspconfig").intelephense.setup({
  settings = {
    intelephense = {
      files = {
        maxSize = 5000000;
      };
    };
  };
})


require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}
require("lspconfig").solargraph.setup({})
require("lspconfig").ts_ls.setup({})
require("lspconfig").gopls.setup({})
require("lspconfig").tailwindcss.setup({})

require("lspconfig").emmet_ls.setup({
  filetypes = {
    "html", "php", "css", "scss", "javascript", "javascriptreact", 
    "typescriptreact", "blade", "vue", "svelte", -- add all file types where you want emmet
  },

  init_options = {
    -- Extended Emmet options
    preferences = {
      tabSize = 4, -- match your tab settings
      showExpandedAbbreviation = "always",
      showAbbreviationSuggestions = true,
      syntaxProfiles = {
        blade = "html", -- treat blade files as html for emmet
      },
      variables = {
        lang = "en",
        charset = "UTF-8",
      },
    },
    -- Enable all Emmet features
    includeLanguages = {
      ["html"] = "html",
      ["php"] = "html",
      ["blade"] = "html",
    },
    -- Enable more expansions
    expansions = {
      ["html"] = {
        "a", "abbr", "address", "area", "article", "aside", "audio", "b", "base",
        "bdi", "bdo", "blockquote", "body", "br", "button", "canvas", "caption",
        "cite", "code", "col", "colgroup", "data", "datalist", "dd", "del", "details",
        "dfn", "dialog", "div", "dl", "dt", "em", "embed", "fieldset", "figcaption",
        "figure", "footer", "form", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header",
        "hgroup", "hr", "html", "i", "iframe", "img", "input", "ins", "kbd", "label",
        "legend", "li", "link", "main", "map", "mark", "meta", "meter", "nav", "noscript",
        "object", "ol", "optgroup", "option", "output", "p", "param", "picture", "pre",
        "progress", "q", "rp", "rt", "ruby", "s", "samp", "script", "section", "select",
        "small", "source", "span", "strong", "style", "sub", "summary", "sup", "svg",
        "table", "tbody", "td", "template", "textarea", "tfoot", "th", "thead", "time",
        "title", "tr", "track", "u", "ul", "var", "video", "wbr",
        -- Custom components you use frequently
        "x-main", "x-slot", "x-app-layout", "x-guest-layout",
      },
    },
  },
})


vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
