-- local emmet_options = {
--   capabilities = capabilities,
--   filetypes = {
--     "html",
--     "typescript",
--     "javascript",
--     "javascriptreact",
--     "xml",
--   },
--   root_dir = function ()
--     return vim.loop.cwd()
--   end
-- }

require("lvim.lsp.manager").setup("emmet_ls") -- Pass emmet_options as second arg if needed.

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({
  {
    command = "prettierd",
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "less",
      "html",
      "yaml",
      "markdown",
      "markdown.mdx",
      "graphql",
      "handlebars",
      "json",
    }
  },
})

local linters = require "lvim.lsp.null-ls.linters"
linters.setup({
  {
    command = "eslint_d",
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "svelte",
      "vue",
    }
  }
})

lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.vue", "*.js" }
