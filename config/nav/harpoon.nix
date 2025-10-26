{lib, ...}:
lib.mkMerge [
  {
    plugins = {
      harpoon = {
        enable = true;
        enableTelescope = true;
      };
    };

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
        action = "<CMD>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>";
        options.desc = "Harpoon: quick menu";
      }
    ];
  }
  {
    plugins.which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>h";
        icon = "󱡅";
        desc = "Harpoon";
      }
    ];
  }
]
