-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local ok, extras = pcall(require, "config.colors_extras")
if not ok then
  return
end

local function apply()
  pcall(extras.apply)
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = apply,
})
