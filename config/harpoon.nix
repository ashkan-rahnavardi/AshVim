{
  plugins = {
    harpoon = {
      enable = true;
      enableTelescope = true;
    };
  };

  # extraConfigLua = ''
  #
  #   local harpoon = require('harpoon')
  #   harpoon:setup({})
  #
  #   -- basic telescope configuration
  #   local conf = require("telescope.config").values
  #   local function toggle_telescope(harpoon_files)
  #       local file_paths = {}
  #       for _, item in ipairs(harpoon_files.items) do
  #           table.insert(file_paths, item.value)
  #       end
  #
  #       require("telescope.pickers").new({}, {
  #           prompt_title = "Harpoon",
  #           finder = require("telescope.finders").new_table({
  #               results = file_paths,
  #           }),
  #           previewer = conf.file_previewer({}),
  #           sorter = conf.generic_sorter({}),
  #       }):find()
  #   end
  #
  #   vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
  #       { desc = "Open harpoon window" })
  #
  #
  # '';

  keymaps = [
    # add current file
    {
      mode = "n";
      key = "<leader>ha";
      action = "<CMD>lua require('harpoon'):list():add()<CR>";
      options.desc = "Harpoon: add file";
    }

    # jump to next/previous mark
    {
      mode = "n";
      key = "<leader>hn";
      action = "<CMD>lua require('harpoon'):list():next()<CR>";
      options.desc = "Harpoon: next file";
    }
    {
      mode = "n";
      key = "<leader>hp";
      action = "<CMD>lua require('harpoon'):list():prev()<CR>";
      options.desc = "Harpoon: previous file";
    }

    # telescope menu (unchanged)
    {
      mode = "n";
      key = "<leader>hm";
      action = "<CMD>Telescope harpoon marks<CR>";
      options.desc = "Harpoon: Telescope marks";
    }

    # quick‑menu toggle now needs the list object
    {
      mode = "n";
      key = "<leader>hq";
      # action = "<CMD>lua require('harpoon.ui'):toggle_quick_menu(require('harpoon'):list())<CR>";

      action = "<CMD>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>";
      options.desc = "Harpoon: quick menu";
    }
  ];
}
