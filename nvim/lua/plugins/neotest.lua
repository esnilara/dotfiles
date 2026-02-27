return {
  "nvim-neotest/neotest",
  dependencies = {
    "marilari88/neotest-vitest",
    "olimorris/neotest-rspec",
  },
  opts = function(_, opts)
    opts.adapters = opts.adapters or {}

    table.insert(
      opts.adapters,
      require("neotest-rspec")({
        rspec_cmd = function()
          return { "bundle", "exec", "rspec", "--format", "progress" }
        end,

        -- Make root detection unambiguous for Rails apps / monorepos
        root_files = { "Gemfile", ".rspec", ".git" },

        -- If you're in an engine/monorepo, this is the big one:
        -- always run from the project root instead of the engine root.
        engine_support = false,
      })
    )
    table.insert(opts.adapters, require("neotest-vitest"))
    return opts
  end,
}
