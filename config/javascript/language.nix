{
  lib,
  pkgs,
  ...
}: {
  plugins = {
    conform-nvim = {
      settings = {
        formatters_by_ft.javascript = ["prettier"];
        formatters_by_ft.typescript = ["prettier"];
        formatters_by_ft.javascriptreact = ["prettier"];
        formatters_by_ft.typescriptreact = ["prettier"];
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
    lsp.servers.ts-ls = {
      enable = true;
      filetypes = [
        "javascript"
        "javascriptreact"
        "typescript"
        "typescriptreact"
      ];
      extraOptions = {
        settings = {
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true;
              includeInlayFunctionLikeReturnTypeHints = true;
              includeInlayFunctionParameterTypeHints = true;
              includeInlayParameterNameHints = "all";
              includeInlayParameterNameHintsWhenArgumentMatchesName = true;
              includeInlayPropertyDeclarationTypeHints = true;
              includeInlayVariableTypeHints = true;
            };
          };
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true;
              includeInlayFunctionLikeReturnTypeHints = true;
              includeInlayFunctionParameterTypeHints = true;
              includeInlayParameterNameHints = "all";
              includeInlayParameterNameHintsWhenArgumentMatchesName = true;
              includeInlayPropertyDeclarationTypeHints = true;
              includeInlayVariableTypeHints = true;
            };
          };
        };
      };
    };
    lsp.servers = {
      intelephense = {
        enable = true;
        rootDir = ''
          function(fname)
            return vim.fn.getcwd()
          end
        '';
        package = pkgs.nodePackages.intelephense;

        # CUSTOM FOLDING NOT WORKING
        #
        # extraOptions = {
        #   capabilities = {
        #     textDocument = {
        #       foldingRange = {
        #         dynamicRegistration = false;
        #         lineFoldingOnly = true;
        #       };
        #     };
        #   };
        # };
        # settings = {
        #   intelephense = {
        #     environment = {
        #       phpVersion = "8.1";
        #     };
        #     file = {
        #       maxSize = 1000000;
        #     };
        #     folding = {
        #       enable = true;
        #     };
        #   };
        # };
      };

      # PHPACTOR
      #
      # phpactor = {
      #   enable = true;
      #   rootDir = ''
      #     function(fname)
      #       return vim.fn.getcwd()
      #     end
      #   '';
      # };
      eslint.enable = true;
    };
    none-ls.sources.formatting.prettier = {
      enable = true;
      disableTsServerFormatter = false;
    };
  };
}
