{
  plugins = {
    obsidian = {
      enable = true;
      settings = {
        completion = {
          min_chars = 2;
          nvim_cmp = true;
        };
        new_notes_location = "current_dir";
        workspaces = [
          {
            name = "root";
            path = "~/Documents/Notes";
          }
        ];
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>nn";
      action = "<cmd>ObsidianQuickSwitch<cr>";
      options = {desc = "Obsidian Quick Switch";};
    }
  ];

  extraConfigLua = ''
  '';
}
