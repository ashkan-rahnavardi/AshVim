 {pkgs, ...}: {
   extraPackages = [pkgs.lsof];

   plugins.opencode = {
     enable = true;
     settings = {};
   };

   # Set your OpenCode API key here
   # extraConfigLua = ''
   #   vim.g.opencode_opts = {
   #     api_key = "your_opencode_api_key_here"
   #   }
   # '';
 }
