{lib, ...}:
lib.mkMerge [
  {
    plugins.oil = {
      enable = true;
      settings = {
        columns = [
          "icons"
          "permissions"
          "size"
          "mtime"
        ];
        default_file_explorer = true;
        delete_to_trash = true;
        skip_confirmation_for_simple_edits = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<CMD>Oil<CR>";
        options.desc = "Oil";
      }
    ];
  }
  {
    plugins.which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>e";
        icon = "󰏇";
        desc = "Oil";
      }
    ];
  }
]
