{pkgs, ...}: {
  plugins = {
    none-ls = {
      enable = true;
      sources = {
        formatting = {
          alejandra.enable = true;
          prettierd.enable = true;
          sqlformat.enable = true;
          stylua.enable = true;
          yamlfmt.enable = true;
        };
        diagnostics = {
          trivy.enable = true;
          yamllint.enable = true;
        };
      };
    };

    conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          lsp_fallback = "fallback";
          timeout_ms = 500;
        };
        notify_on_error = true;
        formatters_by_ft = {
          css = ["prettierd"];
          html = ["prettierd"];
          json = ["prettierd"];
          lua = ["stylua"];
          sh = ["shfmt"];
          nix = ["alejandra"];
          yaml = ["yamlfmt"];
        };
      };
    };
  };

  extraPackages = with pkgs; [
    shfmt
  ];
}
