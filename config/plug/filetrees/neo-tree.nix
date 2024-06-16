{
  plugins.neo-tree = {
    enable = true;

    closeIfLastWindow = true;
    window = {
      width = 30;
      autoExpandWidth = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<C-n>";
      action = ":Neotree action=focus reveal toggle<CR>";
      options.silent = true;
    }
  ];
}