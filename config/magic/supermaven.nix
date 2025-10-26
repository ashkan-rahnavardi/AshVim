{
  lib,
  config,
  ...
}: {
  plugins.supermaven = {
    enable = true;
    autoLoad = true;
    settings = {
      keymaps = {
        # accept_suggestion = "<Tab>";
        accept_suggestion = "<C-k>";
        clear_suggestions = "<C-]>";
        accept_word = "<C-j>";
      };
      ignore_filetypes = ["cpp"];
      color = {
        suggestion_color = "#ffffff";
        cterm = 244;
      };
      log_level = "info";
      disable_inline_completion = false;
      disable_keymaps = false;

      # Function to determine when supermaven should activate.
      condition = lib.nixvim.mkRaw ''
        function()
          return true
        end
      '';
    };
  };
}
