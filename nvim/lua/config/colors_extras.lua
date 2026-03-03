local M = {}

local function set(name, opts)
  -- safe wrapper to avoid runtime errors
  pcall(vim.api.nvim_set_hl, 0, name, opts)
end

function M.apply()
  local ok, normal = pcall(vim.api.nvim_get_hl_by_name, "Normal", true)
  if not ok then
    normal = {}
  end

  local fg = normal.foreground and string.format("#%06x", normal.foreground)
  local bg = normal.background and string.format("#%06x", normal.background)

  local panel_bg = bg or "#1e1b2d"
  local panel_fg = fg or "#efefef"
  local border = "#7c3fbf"

  set("NormalFloat", { bg = panel_bg, fg = panel_fg })
  set("FloatBorder", { bg = panel_bg, fg = border })
  set("Pmenu", { bg = panel_bg, fg = panel_fg })

  set("NeoTreeNormal", { bg = panel_bg, fg = panel_fg })
  set("NeoTreeNormalNC", { bg = panel_bg, fg = panel_fg })
  set("NeoTreeFloatBorder", { bg = panel_bg, fg = border })
  set("NvimTreeNormal", { bg = panel_bg, fg = panel_fg })

  set("TelescopeNormal", { bg = panel_bg, fg = panel_fg })
  set("TelescopeBorder", { bg = panel_bg, fg = border })

  -- return true to indicate success (optional)
  return true
end

return M
