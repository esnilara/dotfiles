return {
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function(_, opts)
      opts.indent = opts.indent or {}
      opts.scope = opts.scope or {}

      opts.indent.highlight = { "RailscastsIndent" }
      opts.scope.highlight = { "RailscastsScope" }
    end,
    config = function(_, opts)
      local hooks = require("ibl.hooks")

      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RailscastsIndent", { fg = "#303030" })
        vim.api.nvim_set_hl(0, "RailscastsScope", { fg = "#454545" })
      end)

      require("ibl").setup(opts)
    end,
  },
}
