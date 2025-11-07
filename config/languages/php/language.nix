{
  lib,
  pkgs,
  ...
}: let
  # Package Laravel IDE Helper stubs
  laravelIdeHelper = pkgs.fetchFromGitHub {
    owner = "barryvdh";
    repo = "laravel-ide-helper";
    rev = "v2.13.0";
    sha256 = "05b8m1525h4ywyxlhgsw9w6c4byipbzngcw59xfcwl2giyr1qhsg";
  };

  # Package Laravel Framework stubs
  laravelFramework = pkgs.fetchFromGitHub {
    owner = "laravel";
    repo = "framework";
    rev = "v10.48.0";
    sha256 = "1fjl8mxf2qdcz96chc7p5mnx8gwymv2b73yb7ar3b45gwbjqmx7k";
  };
in {
  plugins = {
    treesitter = {
      settings = {
        ensure_installed = ["php" "blade"];
      };
    };
    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          php = ["php"];
          blade = ["blade-formatter"];
        };
        formatters = {
          php = {
            command = "${lib.getExe pkgs.php84Packages.php-cs-fixer}";
            args = ["fix" "$FILENAME"];
            stdin = false;
          };
          blade-formatter = {
            command = "${lib.getExe pkgs.blade-formatter}";
            args = ["--write" "$FILENAME"];
            stdin = false;
          };
        };
      };
    };
    lsp.servers = {
      intelephense = {
        enable = true;
        package = pkgs.nodePackages.intelephense;
        settings = {
          intelephense = {
            format = {
              enable = true;
              indentStyle = "space";
              indentSize = 4;
            };
            stubs = [
              "Core"
              "standard"
              "laravel"
              "illuminate"
              "blade"
              "psr-4"
            ];
            environment.includePaths = [
              "${laravelIdeHelper}"
              "${laravelFramework}"
            ];
            files = {
              associations = ["*.php" "*.blade.php"];
              # exclude = ["**/vendor/**"];
            };
          };
        };
      };
    };
  };

  extraPackages = with pkgs; [
    php84Packages.composer
    php84Packages.php-cs-fixer
    blade-formatter
    php84
    yarn
  ];
}
