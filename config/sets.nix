{
  plugins = {
    auto-save = {
      enable = true;
      # enable = false;
      settings = {
        debounce_delay = 3000;
        # only save if the buffer isn’t the Harpoon UI
        # condition = ''
        #   return vim.bo.filetype ~= "harpoon"
        # '';
      };
    };
    bufferline = {
      # TODO: remove this once you are used to not having it
      enable = false;
      settings = {
        options = {
          always_show_bufferline = false;
          buffer_close_icon = "";
          diagnostics = "nvim_lsp";
        };
      };
    };

    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        current_line_blame_opts = {
          virt_text = true;
          virt_text_pos = "eol";
        };
        signcolumn = true;
        signs = {
          add = {text = "│";};
          change = {text = "│";};
          changedelete = {text = "~";};
          delete = {text = "_";};
          topdelete = {text = "‾";};
          untracked = {text = "┆";};
        };
        watch_gitdir = {follow_files = true;};
      };
    };

    # harpoon = {
    #   enable = true;
    #   saveOnToggle = true;
    #   saveOnChange = true;
    #   enterOnSendcmd = false;
    #   markBranch = true;
    # };

    # hop.enable = true;
    illuminate.enable = true;
    lazygit.enable = true;
    nvim-lightbulb.enable = true;
    lualine = {
      enable = true;
      settings.options.globalstatus = true;
    };
    luasnip.enable = true;

    mini = {
      enable = true;
      modules = {
        ai = {};
        surround = {};
        indentscope = {
          symbol = "│";
          options = {try_as_border = true;};
        };
      };
    };

    noice.enable = true;

    notify = {
      enable = true;
      luaConfig.pre = ''
        require("notify").setup({
          background_colour = "#000000",
        })
      '';
    };

    nvim-autopairs.enable = true;
    ts-autotag.enable = true;
    tailwind-tools.enable = true;
    colorizer.enable = true;
    oil = {
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
    render-markdown.enable = false;
    todo-comments.enable = true;

    treesitter = {
      enable = true;

      folding = false;
      settings = {
        indent.enable = true;
        highlight.enable = true;
      };
    };

    # vim-surround.enable = true;
    web-devicons.enable = true;
  };
}
