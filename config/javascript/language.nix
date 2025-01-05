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
        # formatters_by_ft.php = ["php"];
        # formatters = {
        #   php = {
        #     command = "${lib.getExe pkgs.php82Packages.php-cs-fixer}";
        #     args = ["fix" "$FILENAME"];
        #     stdin = false;
        #   };
        # };
      };
    };
    lsp.servers.ts_ls = {
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
        extraOptions = {
          capabilities.textDocument.formatting = true;
        };
        onAttach.function = ''
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = true })
            end,
          })
        '';
        settings = {
          intelephense = {
            format = {
              enable = true;
            };
          };
        };
      };
      eslint.enable = true;
    };
    none-ls.sources.formatting.prettier = {
      enable = true;
      disableTsServerFormatter = false;
    };
  };
}
# intelephense = {
#   enable = true;
#   rootDir = ''
#     function(fname)
#       return vim.fn.getcwd()
#     end
#   '';
#   package = pkgs.nodePackages.intelephense;
#   extraOptions = {
#     capabilities.textDocument.formatting = true;
#   };
#   onAttach = ''
#     function(client, bufnr)
#       vim.api.nvim_create_autocmd("BufWritePre", {
#         buffer = bufnr,
#         callback = function()
#           vim.lsp.buf.format({ async = true })
#           end,
#       })
#       end
#   '';
#   settings = {
#     intelephense.format.enable = true;
#   };
# };

