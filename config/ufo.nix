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
