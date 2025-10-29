{pkgs, ...}: {
  plugins = {
    none-ls = {
      enable = true;
      sources = {
        formatting = {
          alejandra.enable = true;
          hclfmt.enable = true;
          just.enable = true;
          opentofu_fmt.enable = true;
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
          just = ["just"];
          lua = ["stylua"];
          sh = ["shfmt"];
          nix = ["alejandra"];
          ruby = ["rubyfmt"];
          terraform = ["tofu_fmt"];
          tf = ["tofu_fmt"];
          yaml = ["yamlfmt"];
        };
      };
    };
  };
}
