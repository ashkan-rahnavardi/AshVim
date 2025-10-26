{
  globals.mapleader = " ";

  plugins.which-key = {
    enable = true;
    settings.spec = [
      {
        __unkeyed-1 = "<leader><tab>";
        group = "Tabs";
      }
      {
        __unkeyed-1 = "<leader>q";
        group = "Quit / Session";
      }
      {
        __unkeyed-1 = "<leader>o";
        group = "SOPS";
        icon = "";
      }
      {
        __unkeyed-1 = "<leader>a";
        group = "Avante";
        icon = "󰬈";
      }
    ];
  };

  keymaps = [
    # Normal mode
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>qa<cr>";
      options = {desc = "Quit All";};
    }
    {
      mode = "i";
      key = "jk";
      action = "<CMD>noh<CR><ESC>";
      options.desc = "Normal mode and clear highlight";
    }
    {
      mode = "i";
      key = "<ESC>";
      action = "<CMD>noh<CR><ESC>";
      options.desc = "Normal mode and clear highlight";
    }
    {
      mode = "n";
      key = "<ESC>";
      action = "<CMD>noh<CR><ESC>";
      options.desc = "Normal mode and clear highlight";
    }

    # Hop command
    # {
    #   mode = "n";
    #   key = "m";
    #   action = "<CMD>HopChar1<CR>";
    #   options.desc = "Hop Char 1";
    # }

    # Add undo breakpoints
    {
      mode = "i";
      key = ",";
      action = ",<C-g>u";
      options.desc = "Undo breakpoint";
    }
    {
      mode = "i";
      key = ".";
      action = ".<C-g>u";
      options.desc = "Undo breakpoint";
    }
    {
      mode = "i";
      key = ";";
      action = ";<C-g>u";
      options.desc = "Undo breakpoint";
    }

    # SOPS
    {
      mode = "n";
      key = "<leader>od";
      action = "<CMD>!sops -d -i %<CR><CR>";
      options.desc = "Decrypt SOPS File";
    }
    {
      mode = "n";
      key = "<leader>oe";
      action = "<CMD>!sops -e -i %<CR><CR>";
      options.desc = "Encrypt SOPS File";
    }

    # Windows
    {
      key = "<C-h>";
      action = "<CMD>wincmd h<CR>";
      options.desc = "Navigate Window Left";
    }
    {
      key = "<C-j>";
      action = "<CMD>wincmd j<CR>";
      options.desc = "Navigate Window Down";
    }
    {
      key = "<C-k>";
      action = "<CMD>wincmd k<CR>";
      options.desc = "Navigate Window Up";
    }
    {
      key = "<C-l>";
      action = "<CMD>wincmd l<CR>";
      options.desc = "Navigate Window Right";
    }
    # {
    #   mode = "n";
    #   key = "<leader>w";
    #   action = "<c-w>";
    #   options.desc = "Windows";
    # }
    {
      mode = "n";
      key = "<leader>-";
      action = "<C-W>s";
      options.desc = "Split Window Below";
    }
    {
      mode = "n";
      key = "<leader>|";
      action = "<C-W>v";
      options.desc = "Split Window Right";
    }
    # {
    #   mode = "n";
    #   key = "<leader>wd";
    #   action = "<C-W>c";
    #   options.desc = "Delete Window";
    # }

    # Tabs
    {
      mode = "n";
      key = "<leader><tab>l";
      action = "<CMD>tablast<CR>";
      options.desc = "Last Tab";
    }
    {
      mode = "n";
      key = "<leader><tab>o";
      action = "<CMD>tabonly<CR>";
      options.desc = "Close Other Tabs";
    }
    {
      mode = "n";
      key = "<leader><tab>f";
      action = "<CMD>tabfirst<CR>";
      options.desc = "First Tab";
    }
    {
      mode = "n";
      key = "<leader><tab><tab>";
      action = "<CMD>tabnew<CR>";
      options.desc = "New Tab";
    }
    {
      mode = "n";
      key = "<leader><tab>]";
      action = "<CMD>tabnext<CR>";
      options.desc = "Next Tab";
    }
    {
      mode = "n";
      key = "<leader><tab>d";
      action = "<CMD>tabclose<CR>";
      options.desc = "Close Tab";
    }
    {
      mode = "n";
      key = "<leader><tab>[";
      action = "<CMD>tabprevious<CR>";
      options.desc = "Previous Tab";
    }

    # Buffer
    {
      mode = "n";
      key = "<S-h>";
      action = "<CMD>bprevious<CR>";
      options.desc = "Previous Buffer";
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<CMD>bnext<CR>";
      options.desc = "Next Buffer";
    }
    {
      mode = "n";
      key = "<leader>bb";
      action = "<CMD>e #<CR>";
      options.desc = "Switch To Other Buffer";
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<CMD>bd<CR>";
      options.desc = "Delete Buffer and Window";
    }
  ];
}
