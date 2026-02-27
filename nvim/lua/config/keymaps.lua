-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function github_permalink_current_line()
  local file = vim.fn.expand("%:p")
  local rel = vim.fn.fnamemodify(file, ":~:.")
  local line = vim.api.nvim_win_get_cursor(0)[1]

  -- commit for this line (blame)
  local blame = vim.fn.systemlist({ "git", "blame", "-L", line .. "," .. line, "--porcelain", rel })
  local sha = blame[1] and blame[1]:match("^(%x+)") or nil
  if not sha or sha == "0000000000000000000000000000000000000000" then
    sha = vim.fn.system("git rev-parse HEAD"):gsub("%s+", "")
  end

  local remote = vim.fn.system("git remote get-url origin"):gsub("%s+", "")
  -- normalize ssh/https remotes to https://github.com/owner/repo
  remote = remote:gsub("^git@github.com:", "https://github.com/"):gsub("%.git$", "")
  remote = remote:gsub("^https://github.com/", "https://github.com/")

  local url = string.format("%s/blob/%s/%s#L%d", remote, sha, rel, line)
  vim.ui.open(url)
end

vim.keymap.set("n", "<leader>gP", github_permalink_current_line, { desc = "GitHub permalink (blame SHA)" })
