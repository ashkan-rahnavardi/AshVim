{
  config,
  lib,
  ...
}: {
  imports = [
    ./keys.nix
    ./sets.nix
    ./highlight.nix

    # ./plug/colorscheme/biscuit.nix
    ./plug/colorscheme/colorscheme.nix

    ./plug/bufferlines
    ./plug/completion
    ./plug/git
    ./plug/dap
    ./plug/languages
    ./plug/lsp
    ./plug/none-ls
    ./plug/snippets
    ./plug/statusline
    ./plug/telescope
    ./plug/ui
    ./plug/utils
    ./plug/filetrees
  ];
  options = {
    theme = lib.mkOption {
      default = "paradise";
      type = lib.types.enum ["paradise" "decay" "mountain" "tokyonight" "everforest" "everblush" "jellybeans" "aquarium" "gruvbox"];
    };
    assistant = lib.mkOption {
      default = "none";
      type = lib.types.enum ["copilot" "none"];
    };
  };
  config = {
    # The base16 theme to use, if you want to use another theme, change it in colorscheme.nix
    theme = "paradise";
    extraConfigLua = ''
      _G.theme = "${config.theme}"
    '';
  };
}
