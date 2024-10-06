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
      action = "<cmd>ObsidianQuickSwitch<CR>";
      options = {
        desc = "ObsidianQuickSwitch: quickly switch to (or open) another note in your vault, searching by its name using ripgrep";
      };
    }
  ];
}
