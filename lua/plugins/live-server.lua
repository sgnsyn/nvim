return {
  {
    "barrett-ruth/live-server.nvim",
    build = "npm install -g live-server",
    config = function()
      local https_conf = vim.fn.expand("~/.config/https-cert/https-conf.js")

      -- The plugin now reads configuration from this global table
      -- The 'args' key is replaced by direct configuration keys
      vim.g.live_server = {
        https = https_conf,
        -- You can add other options here, e.g., port = 8080
      }

      -- Keymaps
      vim.keymap.set("n", "<leader>ls", "<cmd>LiveServerStart<CR>", { desc = "Start Live Server" })
      vim.keymap.set("n", "<leader>lk", "<cmd>LiveServerStop<CR>", { desc = "Stop Live Server" })
    end,
  }
}
