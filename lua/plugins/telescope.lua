local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-telescope/telescope-fzf-native.nvim" },
    config = function()
      require("telescope").load_extension("fzf")
    end,
    setup = function()
      local defaults = {
        preview = {
          hide_on_startup = true,
        },
        layout_config = {
          width = 0.8,
          horizontal = {
            preview_width = 0.9,
          },
        },
        mappings = {
          i = {
            ["<C-a>"] = require("telescope.actions.layout").toggle_preview,
          },
        },
      }

      require("telescope").setup({ defaults = defaults })
    end,
    keys = {
      { "<leader><space>", function() Util.telescope("files", { cwd = false }) end, desc = "Find Files (root dir)" },
      { "<leader>fF", function() Util.telescope("files") end, desc = "Find Files (cwd)" },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
        end,
        desc = "Find Files (root dir, hidden files, no ignored)",
      },
    },
  },
}
