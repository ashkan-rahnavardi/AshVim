{
  plugins.which-key = {
    enable = true;

    settings.ignoreMissing = false;
    icons = {
      breadcrumb = "»";
      group = "+";
      separator = ""; # ➜
    };
    # registrations = {
    #   "<leader>t" = " Terminal";
    # };
    window = {
      border = "none";
      winblend = 0;
    };
  };
}
