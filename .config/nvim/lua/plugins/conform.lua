return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters = opts.formatters or {}

      opts.formatters_by_ft.javascript = { "oxfmt" }
      opts.formatters_by_ft.javascriptreact = { "oxfmt" }
      opts.formatters_by_ft.typescript = { "oxfmt" }
      opts.formatters_by_ft.typescriptreact = { "oxfmt" }

      opts.formatters.oxfmt = {
        command = "./node_modules/.bin/oxfmt",
      }
    end,
  },
}
