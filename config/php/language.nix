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
  };
}
