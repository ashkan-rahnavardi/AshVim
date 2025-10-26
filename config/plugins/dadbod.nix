{
  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>D";
      group = "Database";
      icon = "";
    }
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>Du";
      action = "<CMD>DBUI<CR>";
      options.desc = "Show Database UI";
    }
  ];
}
