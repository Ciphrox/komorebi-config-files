-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.wrap = true

DEFAULT_SCALE = 0.8

if vim.g.neovide then
  vim.g.neovide_opacity = 0.6
  vim.g.neovide_window_blurred = false

  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5

  vim.g.neovide_hide_mouse_when_typing = true

  vim.g.experimental_layer_grouping = true
  vim.g.neovide_refresh_rate = 240
  vim.g.neovide_refresh_rate_idle = 5

  vim.o.guifont = "FiraCode_Nerd_Font"

  vim.g.neovide_scale_factor = DEFAULT_SCALE

  vim.g.neovide_confirm_quit = true

  -- Cursor
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_smooth_blink = true

  -- Keymaps
  vim.keymap.set("n", "<C-=>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.1
  end)
  vim.keymap.set("n", "<C-->", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 0.9
  end)
  vim.keymap.set("n", "<C-0>", function()
    vim.g.neovide_scale_factor = DEFAULT_SCALE
  end)
end
