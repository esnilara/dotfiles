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

local function open_term(cmd)
  -- Create a brand-new empty buffer in a bottom split (not a copy of the current buffer)
  vim.cmd("botright 15new")
  vim.bo.bufhidden = "wipe" -- close buffer when window closes
  vim.fn.termopen(cmd)
  vim.cmd("startinsert")
end

-- Run current spec file
vim.keymap.set("n", "<leader>tf", function()
  local file = vim.fn.expand("%:p")
  open_term("bundle exec rspec " .. file)
end, { desc = "Terminal RSpec file" })

-- Run spec at current line
vim.keymap.set("n", "<leader>tR", function()
  local file = vim.fn.expand("%:p")
  local line = vim.fn.line(".")
  open_term("bundle exec rspec " .. file .. ":" .. line)
end, { desc = "Terminal RSpec line" })
