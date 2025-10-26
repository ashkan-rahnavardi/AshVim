{lib, ...}:
lib.mkMerge [
  {
    plugins.bufferline = {
      enable = true;
      settings = {
        options = {
          always_show_bufferline = false;
          buffer_close_icon = "";
          diagnostics = "nvim_lsp";
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>bp";
        action = "<CMD>BufferLineTogglePin<CR>";
        options.desc = "Toggle Pin";
      }
      {
        mode = "n";
        key = "<leader>bP";
        action = "<CMD>BufferLineGroupClose ungrouped<CR>";
        options.desc = "Delete Non-Pinned Buffers";
      }
      {
        mode = "n";
        key = "<leader>bo";
        action = "<CMD>BufferLineCloseOthers<CR>";
        options.desc = "Delete Other Buffers";
      }
      {
        mode = "n";
        key = "<leader>br";
        action = "<CMD>BufferLineCloseRight<CR>";
        options.desc = "Delete Buffers to the Right";
      }
      {
        mode = "n";
        key = "<leader>bl";
        action = "<CMD>BufferLineCloseLeft<CR>";
        options.desc = "Delete Buffers to the Left";
      }
    ];
  }
  {
    plugins.which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>b";
        group = "Buffer";
      }
    ];
  }
]
