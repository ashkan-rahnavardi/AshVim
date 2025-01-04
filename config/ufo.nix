{
  plugins = {
    nvim-ufo = {
      enable = true;
      luaConfig = {
        content = ''
          vim.o.foldcolumn = '1'
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

