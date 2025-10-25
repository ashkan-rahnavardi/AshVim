{
  lib,
  pkgs,
  ...
}: {
  plugins = {
    conform-nvim = {
      settings = {
        formatters_by_ft = {
          javascript = ["prettierd"];
          javascriptreact = ["prettierd"];
          typescript = ["prettierd"];
          typescriptreact = ["prettierd"];
        };
        # formatters.prettierd.timeout_ms = 10000;
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
      eslint.enable = true;
      tailwindcss.enable = true;
    };
    none-ls.sources.formatting = {
      prettierd = {
        enable = true;
        disableTsServerFormatter = true;
      };
    };
  };
}
