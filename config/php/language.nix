{
  lib,
  pkgs,
  ...
}: {
  plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft.php = ["php"];
        formatters = {
          php = {
            command = "${lib.getExe pkgs.php82Packages.php-cs-fixer}";
            args = ["fix" "$FILENAME"];
            stdin = false;
          };
        };
      };
    };
    lsp.servers.phpactor = {
      enable = true;
    };
    # lsp.servers.pylsp = {
    #   enable = true;
    #   settings.plugins = {
    #     black.enabled = true;
    #     flake8.enabled = true;
    #     isort.enabled = true;
    #     jedi.enabled = true;
    #     mccabe.enabled = true;
    #     pycodestyle.enabled = true;
    #     pydocstyle.enabled = true;
    #     pyflakes.enabled = true;
    #     pylint.enabled = true;
    #     rope.enabled = true;
    #     yapf.enabled = true;
    #   };
    # };
    none-ls.sources.formatting.black.enable = true;
  };
}
