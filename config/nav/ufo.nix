{
  plugins = {
    nvim-ufo = {
      enable = true;
      luaConfig = {
        content = ''
          vim.o.foldcolumn = '0'
          vim.o.foldlevel = 99
          vim.o.foldlevelstart = 99
          vim.o.foldenable = true

          -- Key mappings for opening/closing folds
          vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
          vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

          -- Use Tree-sitter for folding everything inside {}
          vim.o.foldmethod = 'expr'
          vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

          -- UFO setup
          require('ufo').setup({
            provider_selector = function(bufnr, filetype, buftype)
              return {'treesitter', 'indent'} -- Use Tree-sitter as the main provider
            end
          })
        '';
      };
    };
  };

  extraConfigLua = ''
    function ToggleFoldLevel()
      if vim.wo.foldlevel == 20 then
        vim.wo.foldlevel = 1
      else
        vim.wo.foldlevel = 20
      end
    end
    vim.g.ToggleFoldLevel = ToggleFoldLevel -- Make it globally accessible
  '';

  keymaps = [
    {
      mode = "n";
      key = "zz";
      action = "<CMD> lua vim.g.ToggleFoldLevel()<CR>";
      options.desc = "Toggle FoldLevel 20/2";
    }
    {
      mode = "n";
      key = "z1";
      action = "<CMD>set foldlevel=1<CR>";
      options.desc = "Set FoldLevel 1";
    }
    {
      mode = "n";
      key = "z2";
      action = "<CMD>set foldlevel=2<CR>";
      options.desc = "Set FoldLevel 2";
    }
    {
      mode = "n";
      key = "z3";
      action = "<CMD>set foldlevel=3<CR>";
      options.desc = "Set FoldLevel 3";
    }
    {
      mode = "n";
      key = "z4";
      action = "<CMD>set foldlevel=4<CR>";
      options.desc = "Set FoldLevel 4";
    }
    {
      mode = "n";
      key = "z5";
      action = "<CMD>set foldlevel=5<CR>";
      options.desc = "Set FoldLevel 5";
    }
    {
      mode = "n";
      key = "z6";
      action = "<CMD>set foldlevel=6<CR>";
      options.desc = "Set FoldLevel 6";
    }
    {
      mode = "n";
      key = "z7";
      action = "<CMD>set foldlevel=7<CR>";
      options.desc = "Set FoldLevel 7";
    }
    {
      mode = "n";
      key = "z8";
      action = "<CMD>set foldlevel=8<CR>";
      options.desc = "Set FoldLevel 8";
    }
    {
      mode = "n";
      key = "z9";
      action = "<CMD>set foldlevel=9<CR>";
      options.desc = "Set FoldLevel 9";
    }
  ];
}
# FOLDING BASED OFF LSP
#
# {
#   plugins = {
#     nvim-ufo = {
#       enable = true;
#       luaConfig = {
#         content = ''
#           vim.o.foldcolumn = '1' -- '0' is not bad
#           vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
#           vim.o.foldlevelstart = 99
#           vim.o.foldenable = true
#
#           -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
#           vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
#           vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
#
#           -- Option 2: nvim lsp as LSP client
#           -- Tell the server the capability of foldingRange,
#           -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
#           local capabilities = vim.lsp.protocol.make_client_capabilities()
#           capabilities.textDocument.foldingRange = {
#               dynamicRegistration = false,
#               lineFoldingOnly = true
#           }
#           local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
#           for _, ls in ipairs(language_servers) do
#               require('lspconfig')[ls].setup({
#                   capabilities = capabilities
#                   -- you can add other fields for setting up lsp server in this table
#               })
#           end
#           require('ufo').setup()
#           --
#         '';
#       };
#     };
#   };
# }

