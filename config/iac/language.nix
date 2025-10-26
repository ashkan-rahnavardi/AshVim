{pkgs, ...}: {
  plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          terraform = ["tofu_fmt"];
          tf = ["tofu_fmt"];
        };
      };
    };
    lsp.servers = {
      ansiblels.enable = true;
      dockerls.enable = true;
      helm-ls.enable = true;
      nginx-language-server.enable = true;
      terraformls.enable = true;
    };
  };
}
