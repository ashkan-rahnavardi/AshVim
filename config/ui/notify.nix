{
  plugins.notify = {
    enable = true;
    luaConfig.pre = ''
      require("notify").setup({
        background_colour = "#000000",
      })
    '';
  };
}
