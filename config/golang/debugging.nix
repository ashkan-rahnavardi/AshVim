{pkgs, ...}: {
  plugins.dap-go = {
    enable = true;
    settings.delve.path = "${pkgs.delve}/bin/dlv";
  };
  # plugins.dap.extensions.dap-go = {
  #   enable = true;
  #   delve.path = "${pkgs.delve}/bin/dlv";
  # };
}
