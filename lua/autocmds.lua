vim.api.nvim_create_autocmd("BufWinLeave", {
  callback = function()
    local file = vim.api.nvim_buf_get_name(0)
    if file ~= "" and vim.bo.buftype == "" then
      vim.cmd("mkview")
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function()
    local file = vim.api.nvim_buf_get_name(0)
    if file ~= "" and vim.bo.buftype == "" then
      vim.cmd("silent! loadview")
    end
  end,
})
