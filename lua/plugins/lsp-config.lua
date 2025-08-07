return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.ts_ls.setup({ capabilities = capabilities })
      lspconfig.gopls.setup({ capabilities = capabilities })
      lspconfig.postgres_lsp.setup({ capabilities = capabilities })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "lsp show information" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP goto declaration" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP goto definition" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.o.updatetime = 500
      vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]]
    end,
  },
}
