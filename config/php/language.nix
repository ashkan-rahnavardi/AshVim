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
    lsp.servers = {
      # phpactor = {
      #   enable = true;
      #   rootDir = ''
      #     function(fname)
      #       return vim.fn.getcwd()
      #     end
      #   '';
      # };
      intelephense = {
        enable = true;
        package = pkgs.nodePackages.intelephense;
        settings = {
          intelephense = {
            format = {
              enable = true;
              indentStyle = "space";
              indentSize = 7;
            };
            stubs = ["wordpress" "woocommerce-stubs" "wordpress-globals" "acf-pro" "polylang" "wp-cli" "genesis" "Core" "standard"];
            environment.includePaths = ["/home/ash/.config/composer/vendor/php-stubs/"];
            # environment.includePaths = ["/home/ash/projects/work/rtb/website/"];
          };
        };
      };
      # intelephense = {
      # enable = true;
      # rootDir = ''
      #   function(fname)
      #     return vim.fn.getcwd()
      #   end
      # '';
      # package = pkgs.nodePackages.intelephense;
      # extraOptions = {
      #   capabilities = {
      #     textDocument = {
      #       formatting = true; # Enable document formatting
      #       onTypeFormatting = true; # Enable on-type formatting
      #     };
      #   };
      # };
      # onAttach.function = ''
      #   vim.api.nvim_create_autocmd('BufWritePre', {
      #     buffer = bufnr,
      #     callback = function()
      #       vim.lsp.buf.format({
      #         async = false,
      #         filter = function(client)
      #           return client.name == "intelephense"
      #         end,
      #       })
      #     end,
      #   })
      # '';
      #   settings = {
      #     intelephense = {
      #       format = {
      #         enable = true;
      #         indentStyle = "space";
      #         indentSize = 7;
      #       };
      #       stubs = ["wordpress" "woocommerce" "wordpress-globals" "acf-pro" "polylang" "wp-cli" "genesis" "Core"];
      #       environment.includePaths = "/home/ash/.config/composer/vendor/php-stubs/";
      #     };
      #   };
      # };
      # intelephense = {
      #   enable = true;
      #   settings = {
      #     stubs = ["wordpress" "woocommerce" "wordpress-globals"];
      #     environment.includePaths = "/home/ash/.config/composer/vendor/php-stubs/";
      #     foo_bar = 42;
      #   };
      # };
    };
  };
}
