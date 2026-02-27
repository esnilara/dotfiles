return {
  {
    "johnseth97/codex.nvim",
    keys = {
      {
        "<leader>ae",
        function()
          require("codex").toggle()
        end,
        desc = "Toggle Codex",
      },
    },
    opts = {
      keymaps = {
        toggle = "<leader>cc",
      },
    },
  },
}
