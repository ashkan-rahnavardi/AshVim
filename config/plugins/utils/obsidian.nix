{
  plugins.obsidian = {
    enable = true;
    settings = {
      workspaces = [
        {
          name = "Notes";
          path = "~/Documents/Notes/";
        }
      ];
      # templates = {
      #   subdir = "templates";
      #   dateFormat = "%Y-%m-%d";
      #   timeFormat = "%H:%M";
      #   substitutions = {};
      # };
      #
      # dailyNotes = {
      #   folder = "0_Daily_Notes";
      #   dateFormat = "%Y-%m-%d";
      #   aliasFormat = "%B %-d, %Y";
      # };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>oo";
      action = "<cmd>ObsidianOpen<CR>";
      options = {
        desc = "Open Obsidian Vault";
      };
    }
  ];
}
