{pkgs, lib, ...}: let
  augment-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "augment-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "augmentcode";
      repo = "augment.vim";
      rev = "df56563fe534eb7d0daeaa8c8de3b54700fbbaf8";
      hash = "sha256-aq7W1GoJNP59Gzx9eOFA0CLz5S+mUh3DSP4izmr2E0g=";
    };
    nvimSkipModule = "outline.providers.norg";

    propagatedBuildInputs = [pkgs.nodejs_22];
  };
in
  lib.mkMerge [
    {
      extraPlugins = [augment-nvim];
      extraPackages = [pkgs.nodejs_22];
      extraConfigLua = ''
        vim.g.augment_node_command = "node"
      '';
      keymaps = [
        {
          mode = "i";
          key = "<C-p>";
          action = "<CMD>call augment#Accept()<CR>";
          options.desc = "Accept AugmentCode suggestion";
        }
        {
          mode = "n";
          key = "<leader>As";
          action = "<CMD>Augment status<CR>";
          options.desc = "AugmentCode Status";
        }
        {
          mode = "n";
          key = "<leader>Ae";
          action = "<CMD>Augment enable<CR>";
          options.desc = "AugmentCode Enable";
        }
        {
          mode = "n";
          key = "<leader>Ad";
          action = "<CMD>Augment disable<CR>";
          options.desc = "AugmentCode Disable";
        }
        {
          mode = "n";
          key = "<leader>Ac";
          action = "<CMD>Augment chat<CR>";
          options.desc = "Chat with AugmentCode";
        }
        {
          mode = "n";
          key = "<leader>An";
          action = "<CMD>Augment chat-new<CR>";
          options.desc = "Start a new chat";
        }
        {
          mode = "n";
          key = "<leader>At";
          action = "<CMD>Augment chat-toggle<CR>";
          options.desc = "Toggle chat window";
        }
      ];
    }
    {
      plugins.which-key.settings.spec = [
        {
          __unkeyed-1 = "<leader>A";
          group = "AugmentCode";
          icon = "󰬈";
        }
      ];
    }
  ]
