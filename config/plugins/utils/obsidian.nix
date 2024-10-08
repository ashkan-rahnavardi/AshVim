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
      templates = {
        subdir = "/Extras/Templates/";
        # dateFormat = "%Y-%m-%d";
        # timeFormat = "%H:%M";
        # substitutions = {};
      };

      dailyNotes = {
        folder = "notes/sb";
        template = "Template, Daily Note";
        # dateFormat = "%Y-%m-%d";
        # aliasFormat = "%B %-d, %Y";
      };

      note_id_func = ''
        function(title)
          if title ~= nil then
            -- If title is provided, format it as the ID.
            return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
          else
            -- If no title is provided, use the date as the ID in YYYY-MM-DD format.
            return os.date("%Y-%m-%d")
          end
        end
      '';
      note_path_func = ''
        function(spec)
          -- Append "/sb/" to the provided directory in spec.dir
          local target_dir = spec.dir / "sb"
          -- Combine target directory with the note ID and add the .md extension
          local path = target_dir / tostring(spec.id)
          return path:with_suffix(".md")
        end
      '';
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
    {
      mode = "n";
      key = "<leader>on";
      action = "<cmd>ObsidianNew<CR>";
      options = {
        desc = "ObsidianNew: Create New Note, if no title entered todays date will be used, if this file already exists then it opens this file";
      };
    }
  ];
}
