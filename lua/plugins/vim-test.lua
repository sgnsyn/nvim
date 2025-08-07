return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux'
  },
  vim.keymap.set('n', '<leader>tt', ':TestNearest<CR>', { desc = 'TestNearest' }),
  vim.keymap.set('n', '<leader>tT', ':TestFile<CR>', { desc = 'TestFile' }),
  vim.keymap.set('n', '<leader>ta', ':TestSuite<CR>', { desc = 'TestSuite' }),
  vim.keymap.set('n', '<leader>tl', ':TestLast<CR>', { desc = 'TestLast' }),
  vim.keymap.set('n', '<leader>tg', ':TestVisit<CR>', { desc = 'TestVisit' }),

  vim.cmd("let test#strategy = 'vimux'")

}
