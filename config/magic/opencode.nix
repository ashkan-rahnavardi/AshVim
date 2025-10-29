{pkgs, ...}: {
  config = {
    extraPackages = [pkgs.lsof];

    opts.autoread = true;

    plugins.opencode = {
      enable = true;
      settings = {};
    };

    keymaps = [
      {
        mode = ["n" "x"];
        key = "<C-a>";
        action = "<CMD>lua require('opencode').ask('@this: ', { submit = true })<CR>";
        options.desc = "Ask opencode";
      }
      {
        mode = ["n" "x"];
        key = "<C-x>";
        action = "<CMD>lua require('opencode').select()<CR>";
        options.desc = "Execute opencode action…";
      }
      {
        mode = ["n" "x"];
        key = "ga";
        action = "<CMD>lua require('opencode').prompt('@this')<CR>";
        options.desc = "Add to opencode";
      }
      {
        mode = "n";
        key = "<C-.>";
        action = "<CMD>lua require('opencode').toggle()<CR>";
        options.desc = "Toggle opencode";
      }
      {
        mode = "n";
        key = "<S-C-u>";
        action = "<CMD>lua require('opencode').command('messages_half_page_up')<CR>";
        options.desc = "opencode half page up";
      }
      {
        mode = "n";
        key = "<S-C-d>";
        action = "<CMD>lua require('opencode').command('messages_half_page_down')<CR>";
        options.desc = "opencode half page down";
      }
      {
        mode = "n";
        key = "+";
        action = "<C-a>";
        options = {
          desc = "Increment";
          noremap = true;
        };
      }
      {
        mode = "n";
        key = "-";
        action = "<C-x>";
        options = {
          desc = "Decrement";
          noremap = true;
        };
      }
    ];
  };
}
