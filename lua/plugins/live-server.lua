return {
  {
    "barrett-ruth/live-server.nvim",
    build = "npm install -g live-server",
    config = function()

      local https_conf = vim.fn.expand("~/.config/https-cert/https-conf.js")
      local abs_path = vim.fn.fnamemodify(https_conf, ":p")

      require("live-server").setup({
        args = { "--https=" .. abs_path },
      })

      vim.keymap.set("n", "<leader>ls", "<cmd>LiveServerStart<CR>", { desc = "Start Live Server" })
      vim.keymap.set("n", "<leader>lk", "<cmd>LiveServerStop<CR>", { desc = "Stop Live Server" })
    end,
  }
}
