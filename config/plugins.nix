{pkgs, ...}: let
  outline-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "outline-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "hedyhli";
      repo = "outline.nvim";
      rev = "d5c29ee3ff3b7d1bdd454b37698316e67808c36e";
      hash = "sha256-uWMHUkrGo8D3nUvYrDcXOWbXLWvFv9rWsBxLfR2ckcY=";
    };
    nvimSkipModule = "outline.providers.norg";
  };
  augment-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "augment-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "augmentcode";
      repo = "augment.vim";
      rev = "df56563fe534eb7d0daeaa8c8de3b54700fbbaf8";
      hash = "sha256-aq7W1GoJNP59Gzx9eOFA0CLz5S+mUh3DSP4izmr2E0g=";
      # rev = "e14cbe9fdc33dff1a4b55c0fc858b94f5e833862";
      # hash = "sha256-VzHFmt8uOsZEYqIGAbwSrmGLlOfTnL7QvsRB5yMpSG0=";
    };
    nvimSkipModule = "outline.providers.norg";

    propagatedBuildInputs = [pkgs.nodejs_22];
  };
in {
  extraPlugins = with pkgs; [
    vimPlugins.vim-dadbod # DB client
    vimPlugins.vim-dadbod-completion # DB completion
    vimPlugins.vim-dadbod-ui # DB UI
    vimPlugins.vim-tmux-navigator # tmux navigation
    outline-nvim # Document outliner
    augment-nvim # AI code completion
  ];

  extraConfigLua = ''
    vim.g.augment_node_comman = "node"


    require("outline").setup {}
  '';
}
