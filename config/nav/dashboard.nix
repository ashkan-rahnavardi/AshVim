{
  plugins.alpha = {
    enable = true;
    theme = null;
    settings.layout = let
      padding = val: {
        type = "padding";
        inherit val;
      };
    in [
      # (padding 4)
      {
        type = "terminal";
        # command = "echo -e '\033[31mThis text should be red.\033[0m'";
        # command = "echo 'hello world'";
        # command = "bash -c 'echo hello world; sleep 3'";
        command = "cmatrix";
        # command = "chafa -f symbols --symbols braille -c 256 --view-size=72x27 /home/ash/Pictures/me/hackcan.png";
        # command = "cat /home/ash/Pictures/me/hackcan-color.txt";
        width = 400;
        height = 40;
        opts = {
          redraw = "true";
          position = "center";
        };
      }
      (padding 2)
      {
        type = "button";
        # val = "  Find File";
        val = "🔍 Find File";
        on_press.raw = "require('telescope.builtin').find_files";
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "f"
            ":Telescope find_files <CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "f";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      (padding 1)
      {
        type = "button";
        # val = "  New File";
        val = "📄 New File";
        on_press.__raw = "function() vim.cmd[[ene]] end";
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "n"
            ":ene <BAR> startinsert <CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "n";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      (padding 1)
      {
        type = "button";
        # val = "󰈚  Recent Files";
        val = "⌛ Recent Files";
        on_press.raw = "require('telescope.builtin').oldfiles";
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "r"
            ":Telescope oldfiles <CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "r";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      (padding 1)
      {
        type = "button";
        # val = "󰈭  Find Word";
        val = "🔭 Find Word";
        on_press.raw = "require('telescope.builtin').live_grep";
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "g"
            ":Telescope live_grep <CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "g";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      (padding 1)
      {
        type = "button";
        val = "🔁 Restore Session";
        on_press.raw = "require('persistence').load()";
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "s"
            ":lua require('persistence').load()<cr>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "s";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      (padding 1)
      {
        type = "button";
        val = "💣  Quit Neovim";
        on_press.__raw = "function() vim.cmd[[qa]] end";
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "q"
            ":qa<CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "q";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      (padding 2)
      {
        opts = {
          hl = "GruvboxBlue";
          position = "center";
        };
        type = "text";
        val = "It's not rocket surgery";
      }
    ];
  };
}
