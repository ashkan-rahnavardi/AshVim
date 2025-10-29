{
  plugins = {
    obsidian = {
      enable = true;
      settings = {
        completion = {
          min_chars = 2;
          nvim_cmp = true;
        };
        workspaces = [
          {
            name = "root";
            path = "~/Documents/Notes";
          }
        ];
        notes_subdir = "notes";
        new_notes_location = "notes_subdir";
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
