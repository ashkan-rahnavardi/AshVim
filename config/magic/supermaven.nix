{lib, config, ...}:
let
  supermavenSource = {
    name = "supermaven";
  };

  supermavenTabMapping = ''
    cmp.mapping(
      function(fallback)
        local has_supermaven, supermaven = pcall(require, "supermaven-nvim.completion_preview")
        if has_supermaven and supermaven.has_suggestion and supermaven.has_suggestion() then
          supermaven.on_accept_suggestion()
          return
        end

        local col = vim.fn.col('.') - 1

        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        elseif luasnip.expand_or_jumpable and luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
          fallback()
        else
          cmp.complete()
        end
      end,
      { "i", "s" }
    )
  '';
in
  lib.mkMerge [
    {
      plugins.supermaven = {
        enable = true;
        autoLoad = true;
        settings = {
          keymaps = {
            accept_suggestion = "<Tab>";
            clear_suggestions = "<C-]>";
            accept_word = "<C-j>";
          };
          ignore_filetypes = ["cpp"];
          color = {
            suggestion_color = "#ffffff";
            cterm = 244;
          };
          log_level = "info";
          disable_inline_completion = false;
          disable_keymaps = false;

          # Function to determine when supermaven should activate.
          condition = lib.nixvim.mkRaw ''
            function()
              return true
            end
          '';
        };
      };
    }
    (lib.mkIf (config.plugins.supermaven.enable or false) {
      plugins.cmp.settings = {
        sources = lib.mkAfter [supermavenSource];
        mapping."<Tab>" = lib.mkForce supermavenTabMapping;
      };
    })
  ]
