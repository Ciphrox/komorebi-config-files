return {
  "jiaoshijie/undotree",
  -- Load the plugin only when its keybinding is used for efficiency
  keys = {
    -- Map <leader>u to toggle the undotree view
    { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "Toggle Undotree" },
  },
  config = function()
    -- Optional: configure undotree options if needed, otherwise defaults are used
    require("undotree").setup({
      float_diff = true,      -- Use a floating window for diff preview
      layout = "left_bottom", -- Position the main window
      -- Add more configuration options as per the documentation
    })
  end,
}
