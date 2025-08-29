return {
  "sgnsyn/code_runner.nvim",
  config = function()
    require("code_runner").setup({
      filetype = {
        python = "python3 $file",
        javascript = "node $file",
        typescript = "ts-node $file",
        go = "go run $file",
        rust = "cargo run",
        cpp = "g++ $file -o $filePathWithoutExt && $filePathWithoutExt",
        c = "gcc $file -o $filePathWithoutExt && $filePathWithoutExt",
        sh = "bash $file",
        lua = "lua $file",
      },
    })
    vim.keymap.set("n", "<leader>rr", ":RunCode<CR>", { desc = "Run code file" })
    vim.keymap.set("n", "<leader>rk", ":RunClose<CR>", { desc = "Terminate code run" })
  end,
}
