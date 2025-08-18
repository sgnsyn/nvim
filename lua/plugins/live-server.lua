return {
  {
    "barrett-ruth/live-server.nvim",
    build = "npm install -g live-server",
    config = function()
      require("live-server").setup()
      vim.keymap.set("n", "<leader>ls", "<cmd>LiveServerStart<CR>", { desc = "Start Live Server" })
      vim.keymap.set("n", "<leader>lk", "<cmd>LiveServerStop<CR>", { desc = "Stop Live Server" })
    end
  }
}
