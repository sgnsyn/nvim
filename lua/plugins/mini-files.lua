return {
  "echasnovski/mini.files",
  version = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local minifiles = require("mini.files")
    local show_dotfiles = false

    local filter_show = function() return true end
    local filter_hide = function(entry) return entry.name:sub(1, 1) ~= "." end

    minifiles.setup({
      content = { filter = filter_hide },
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 100, -- Increased preview width
      },
    })

    -- Map keys to specific mini.files buffers
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local b = args.data.buf_id

        -- ESC to close
        vim.keymap.set("n", "<Esc>", minifiles.close, { buffer = b, desc = "Close" })

        -- "." to toggle hidden files
        vim.keymap.set("n", ".", function()
          show_dotfiles = not show_dotfiles
          local new_filter = show_dotfiles and filter_show or filter_hide
          minifiles.refresh({ content = { filter = new_filter } })
        end, { buffer = b, desc = "Toggle Hidden" })

        -- "Enter" to open the file and close the explorer
        vim.keymap.set("n", "<CR>", function()
          minifiles.go_in({ close_on_file = true })
        end, { buffer = b, desc = "Open File" })
      end,
    })

    -- Global keymap to open explorer
    vim.keymap.set("n", "<leader>e", function()
      if not minifiles.close() then
        minifiles.open(vim.api.nvim_buf_get_name(0))
      end
    end, { desc = "Toggle Mini Files" })
  end,
}
