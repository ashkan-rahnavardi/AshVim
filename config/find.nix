{lib, ...}:
lib.mkMerge [
  {
    plugins = {
      fzf-lua = {
        enable = true;
        keymaps = {
          "<leader>/" = {
            action = "live_grep";
            options.desc = "Live Grep";
          };
          "<leader>," = {
            action = "buffers";
            options.desc = "Switch Buffer";
            settings = {
              sort_mru = true;
              sort_lastused = true;
            };
          };
          "<leader>gc" = {
            action = "git_commits";
            options.desc = "Git Commits";
          };
          "<leader>gs" = {
            action = "git_status";
            options.desc = "Git Status";
          };
          "<leader>s\"" = {
            action = "registers";
            options.desc = "Registers";
          };
          "<leader>sd" = {
            action = "diagnostics_document";
            options.desc = "Document Diagnostics";
          };
          "<leader>sD" = {
            action = "diagnostics_workspace";
            options.desc = "Workspace Diagnostics";
          };
          "<leader>sh" = {
            action = "help_tags";
            options.desc = "Help Pages";
          };
          "<leader>sk" = {
            action = "keymaps";
            options.desc = "Key Maps";
          };
        };
      };
      telescope.enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>ff";
        action = "<CMD>lua require('fzf-lua').files({ cwd = vim.loop.cwd() })<CR>";
        options.desc = "Find Files";
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = "<CMD>lua require('fzf-lua').oldfiles({ cwd = vim.loop.cwd() })<CR>";
        options.desc = "Recent Files";
      }
      {
        mode = "n";
        key = "gd";
        action = "<CMD>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<CR>";
        options.desc = "Goto Definition";
      }
      {
        mode = "n";
        key = "gr";
        action = "<CMD>FzfLua lsp_references jump_to_single_result=true ignore_current_line=true<CR>";
        options.desc = "References";
      }
      {
        mode = "n";
        key = "gI";
        action = "<CMD>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<CR>";
        options.desc = "Goto Implementation";
      }
      {
        mode = "n";
        key = "gy";
        action = "<CMD>FzfLua lsp_typedefs jump_to_single_result=true ignore_current_line=true<CR>";
        options.desc = "Goto T[y]pe Definition";
      }
    ];
  }
  {
    plugins.which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>f";
        group = "File / Find";
      }
      {
        __unkeyed-1 = "<leader>s";
        group = "Search";
      }
      {
        __unkeyed-1 = "<leader>/";
        icon = "";
        desc = "Live Grep";
      }
    ];
  }
]
