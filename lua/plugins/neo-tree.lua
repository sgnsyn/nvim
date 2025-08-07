return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
      window = {
        position = "float",
      },
    })
    vim.keymap.set("n", "<Leader>e", ":Neotree filesystem reveal toggle<CR>", { desc = "Neotree filesystem float" })
  end,
}
