return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.inlay_hints = { enabled = false }

      opts.servers = opts.servers or {}
      opts.servers.oxlint = {}

      return opts
    end,
  },
}
