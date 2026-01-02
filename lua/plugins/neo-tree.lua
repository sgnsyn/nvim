return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = { enabled = true },
        -- Custom Sort Logic
        sort_function = function(a, b)
          -- 1. Prioritize Directories (Standard behavior)
          if a.type ~= b.type then
            return a.type < b.type
          end

          -- 2. Extract extension from the filename
          -- This captures text after the last dot
          local a_ext = a.name:match("%.([^%.]+)$") or ""
          local b_ext = b.name:match("%.([^%.]+)$") or ""

          -- 3. If extensions are different, sort by extension
          if a_ext:lower() ~= b_ext:lower() then
            return a_ext:lower() < b_ext:lower()
          end

          -- 4. Fallback: Alphabetical sort by filename
          return a.name:lower() < b.name:lower()
        end,
      },
      window = {
        position = "float",
      },
    })

    vim.keymap.set("n", "<Leader>e", ":Neotree filesystem reveal toggle<CR>", { desc = "Neotree float" })
  end,
}
