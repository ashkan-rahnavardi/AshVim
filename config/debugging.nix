{pkgs, ...}: {
  plugins = {
    dap-virtual-text.enable = true;
    dap-ui = {
      enable = true;
      settings.floating.mappings = {close = ["<ESC>" "q"];};
    };
    cmp-dap.enable = true;
    dap = {
      enable = true;
      extensions = {
        # dap-ui = {
        #   enable = true;
        #   floating.mappings = {close = ["<ESC>" "q"];};
        # };
        # dap-virtual-text = {enable = true;};
      };
      signs = {
        dapBreakpoint = {
          text = "";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "";
          texthl = "DapBreakpointCondition";
        };
        dapLogPoint = {
          text = "";
          texthl = "DapLogPoint";
        };
      };
    };
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>d";
      group = "Debug";
      icon = "";
    }
    {
      __unkeyed-1 = "<leader>d/";
      group = "Search";
      icon = "";
    }
    {
      __unkeyed-1 = "<leader>da";
      icon = "";
      desc = "Run with Args";
    }
    {
      __unkeyed-1 = "<leader>db";
      icon = "";
      desc = "Toggle Breakpoint";
    }
    {
      __unkeyed-1 = "<leader>dB";
      icon = "";
      desc = "Breakpoint Condition";
    }
    {
      __unkeyed-1 = "<leader>dc";
      icon = "";
      desc = "Continue";
    }
    {
      __unkeyed-1 = "<leader>dC";
      icon = "";
      desc = "Run to cursor";
    }
    {
      __unkeyed-1 = "<leader>de";
      icon = "󰫧";
      desc = "Eval";
    }
    {
      __unkeyed-1 = "<leader>dg";
      icon = "";
      desc = "Go to line (no execute)";
    }
    {
      __unkeyed-1 = "<leader>di";
      icon = "󰆹";
      desc = "Step into";
    }
    {
      __unkeyed-1 = "<leader>dj";
      icon = "";
      desc = "Down";
    }
    {
      __unkeyed-1 = "<leader>dk";
      icon = "";
      desc = "Up";
    }
    {
      __unkeyed-1 = "<leader>dl";
      icon = "";
      desc = "Run Last";
    }
    {
      __unkeyed-1 = "<leader>do";
      icon = "";
      desc = "Step Out";
    }
    {
      __unkeyed-1 = "<leader>dO";
      icon = "";
      desc = "Step Over";
    }
    {
      __unkeyed-1 = "<leader>dp";
      icon = "";
      desc = "Pause";
    }
    {
      __unkeyed-1 = "<leader>dt";
      icon = "";
      desc = "Terminate";
    }
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>dB";
      action = "\n        <cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>\n      ";
      options = {
        silent = true;
        desc = "Breakpoint Condition";
      };
    }
    {
      mode = "n";
      key = "<leader>db";
      action = ":DapToggleBreakpoint<cr>";
      options = {
        silent = true;
        desc = "Toggle Breakpoint";
      };
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = ":DapContinue<cr>";
      options = {
        silent = true;
        desc = "Continue";
      };
    }
    {
      mode = "n";
      key = "<leader>da";
      action = "<cmd>lua require('dap').continue({ before = get_args })<cr>";
      options = {
        silent = true;
        desc = "Run with Args";
      };
    }
    {
      mode = "n";
      key = "<leader>dC";
      action = "<cmd>lua require('dap').run_to_cursor()<cr>";
      options = {
        silent = true;
        desc = "Run to cursor";
      };
    }
    {
      mode = "n";
      key = "<leader>dg";
      action = "<cmd>lua require('dap').goto_()<cr>";
      options = {
        silent = true;
        desc = "Go to line (no execute)";
      };
    }
    {
      mode = "n";
      key = "<leader>di";
      action = ":DapStepInto<cr>";
      options = {
        silent = true;
        desc = "Step into";
      };
    }
    {
      mode = "n";
      key = "<leader>dj";
      action = "\n        <cmd>lua require('dap').down()<cr>\n      ";
      options = {
        silent = true;
        desc = "Down";
      };
    }
    {
      mode = "n";
      key = "<leader>dk";
      action = "<cmd>lua require('dap').up()<cr>";
      options = {
        silent = true;
        desc = "Up";
      };
    }
    {
      mode = "n";
      key = "<leader>dl";
      action = "<cmd>lua require('dap').run_last()<cr>";
      options = {
        silent = true;
        desc = "Run Last";
      };
    }
    {
      mode = "n";
      key = "<leader>do";
      action = ":DapStepOut<cr>";
      options = {
        silent = true;
        desc = "Step Out";
      };
    }
    {
      mode = "n";
      key = "<leader>dO";
      action = ":DapStepOver<cr>";
      options = {
        silent = true;
        desc = "Step Over";
      };
    }
    {
      mode = "n";
      key = "<leader>dp";
      action = "<cmd>lua require('dap').pause()<cr>";
      options = {
        silent = true;
        desc = "Pause";
      };
    }
    {
      mode = "n";
      key = "<leader>dr";
      action = ":DapToggleRepl<cr>";
      options = {
        silent = true;
        desc = "Toggle REPL";
      };
    }
    {
      mode = "n";
      key = "<leader>ds";
      action = "<cmd>lua require('dap').session()<cr>";
      options = {
        silent = true;
        desc = "Session";
      };
    }
    {
      mode = "n";
      key = "<leader>dt";
      action = ":DapTerminate<cr>";
      options = {
        silent = true;
        desc = "Terminate";
      };
    }
    {
      mode = "n";
      key = "<leader>du";
      action = "<cmd>lua require('dapui').toggle()<cr>";
      options = {
        silent = true;
        desc = "Dap UI";
      };
    }
    {
      mode = "n";
      key = "<leader>dw";
      action = "<cmd>lua require('dap.ui.widgets').hover()<cr>";
      options = {
        silent = true;
        desc = "Widgets";
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>de";
      action = "<cmd>lua require('dapui').eval()<cr>";
      options = {
        silent = true;
        desc = "Eval";
      };
    }
    {
      mode = "n";
      key = "<leader>df";
      action = "<CMD>lua require('dap.ext.vscode').load_launchjs()<CR><CMD>Telescope dap configurations<CR>";
      options = {desc = "Debug Configurations";};
    }
    {
      mode = "n";
      key = "<leader>d/c";
      action = "<CMD>Telescope dap commands<CR>";
      options.desc = "Search Commands";
    }
    {
      mode = "n";
      key = "<leader>d/b";
      action = "<CMD>Telescope dap list_breakpoints<CR>";
      options.desc = "Search Breakpoints";
    }
    {
      mode = "n";
      key = "<leader>d/v";
      action = "<CMD>Telescope dap variables<CR>";
      options.desc = "Search Variables";
    }
    {
      mode = "n";
      key = "<leader>d/f";
      action = "<CMD>Telescope dap frames<CR>";
      options.desc = "Search Frames";
    }
  ];

  # Allow DAP UI to automatically open and close when possible
  extraConfigLua = ''
    require('dap').listeners.after.event_initialized['dapui_config'] = require('dapui').open
    require('dap').listeners.before.event_terminated['dapui_config'] = require('dapui').close
    require('dap').listeners.before.event_exited['dapui_config'] = require('dapui').close
  '';

  extraPlugins = [(pkgs.vimPlugins.telescope-dap-nvim)];
}
