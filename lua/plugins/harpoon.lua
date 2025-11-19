return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },

  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({
      settings = {
        save_on_toggle = true,
      },
    })

    local conf = require("telescope.config").values

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
          map("i", "<C-d>", function()
            local state = require("telescope.actions.state")
            local selected_entry = state.get_selected_entry()
            local current_picker = state.get_current_picker(prompt_bufnr)

            harpoon:list():remove_at(selected_entry.index)
            current_picker:delete_selection(function() end)
          end)
          return true
        end,
      }):find()
    end

    local function harpoon_nav(action)
      if vim.bo.filetype == "neo-tree" then
        vim.cmd("Neotree close")
      end

      local list = harpoon:list()
      if action == "next" then
        list:next()
      elseif action == "prev" then
        list:prev()
      else
        list:select(action)
      end
    end

    -- Keymaps
    vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
      { desc = "Open harpoon list in Telescope" })
    vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Harpoon: Toggle Native UI" })
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon: Add File" })

    -- Nav Keymaps
    vim.keymap.set("n", "<leader>h1", function() harpoon_nav(1) end, { desc = "Harpoon: Goto 1" })
    vim.keymap.set("n", "<leader>h2", function() harpoon_nav(2) end, { desc = "Harpoon: Goto 2" })
    vim.keymap.set("n", "<leader>h3", function() harpoon_nav(3) end, { desc = "Harpoon: Goto 3" })
    vim.keymap.set("n", "<leader>h4", function() harpoon_nav(4) end, { desc = "Harpoon: Goto 4" })

    vim.keymap.set("n", "<leader>hp", function() harpoon_nav("prev") end, { desc = "Harpoon: Prev" })
    vim.keymap.set("n", "<leader>hn", function() harpoon_nav("next") end, { desc = "Harpoon: Next" })
  end,
}
