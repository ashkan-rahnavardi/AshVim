let
  selectOpts = "{behavior = cmp.SelectBehavior.Select}";
in
  {pkgs, ...}: {
    plugins = {
      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          performance = {
            debounce = 150;
          };
          sources = [
            {name = "path";}
            {
              name = "nvim_lsp";
              keywordLength = 1;
            }
            {
              name = "buffer";
              keywordLength = 1;
            }
            {name = "supermaven";}
          ];

          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          formatting = {
            fields = [
              "menu"
              "abbr"
              "kind"
            ];
            format = ''
              function(entry, item)
                local menu_icon = {
                  nvim_lsp = '[LSP]',
                  luasnip = '[SNIP]',
                  buffer = '[BUF]',
                  path = '[PATH]',
                }

                item.menu = menu_icon[entry.source.name]
                return item
              end
            '';
          };

          mapping = {
            "<Up>" = "cmp.mapping.select_prev_item(${selectOpts})";
            "<Down>" = "cmp.mapping.select_next_item(${selectOpts})";

            "<C-p>" = "cmp.mapping.select_prev_item(${selectOpts})";
            "<C-n>" = "cmp.mapping.select_next_item(${selectOpts})";

            "<C-u>" = "cmp.mapping.scroll_docs(-4)";
            "<C-d>" = "cmp.mapping.scroll_docs(4)";

            "<C-e>" = "cmp.mapping.abort()";
            "<C-y>" = "cmp.mapping.confirm({select = true})";
            "<CR>" = "cmp.mapping.confirm({select = false})";

            "<C-f>" = ''
              cmp.mapping(
                function(fallback)
                  if luasnip.jumpable(1) then
                    luasnip.jump(1)
                  else
                    fallback()
                  end
                end,
                { "i", "s" }
              )
            '';

            "<C-b>" = ''
              cmp.mapping(
                function(fallback)
                  if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                  else
                    fallback()
                  end
                end,
                { "i", "s" }
              )
            '';

            "<Tab>" = ''
              cmp.mapping(
                function(fallback)
                  local col = vim.fn.col('.') - 1

                  if cmp.visible() then
                    cmp.select_next_item(${selectOpts})
                  elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                    fallback()
                  else
                    cmp.complete()
                  end
                end,
                { "i", "s" }
              )
            '';

            "<S-Tab>" = ''
              cmp.mapping(
                function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item(${selectOpts})
                  else
                    fallback()
                  end
                end,
                { "i", "s" }
              )
            '';
          };
          window = {
            completion = {
              border = "rounded";
              winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None";
              zindex = 1001;
              scrolloff = 0;
              colOffset = 0;
              sidePadding = 1;
              scrollbar = true;
            };
            documentation = {
              border = "rounded";
              winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None";
              zindex = 1001;
              maxHeight = 20;
            };
          };
          completion = {
            autocomplete = [
              "InsertEnter"
              "TextChanged"
            ];
          };
        };
        cmdline = {
          "/" = {
            mapping.__raw = "cmp.mapping.preset.cmdline()";
            sources = [{name = "buffer";}];
          };
          ":" = {
            mapping.__raw = "cmp.mapping.preset.cmdline()";
            sources = [
              {name = "path";}
              {name = "cmdline";}
            ];
          };
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-treesitter.enable = true;
      cmp-cmdline.enable = true;
      dap.enable = true;
      none-ls = {
        enable = true;
        sources.formatting = {
          alejandra.enable = true;
          hclfmt.enable = true;
          just.enable = true;
          opentofu_fmt.enable = true;
          # prettier.enable = true;
          prettierd.enable = true;
          # rubyfmt is broken on darwin-based systems
          rubyfmt.enable = (
            pkgs.stdenv.hostPlatform.system
            != "x86_64-darwin"
            && pkgs.stdenv.hostPlatform.system != "aarch64-darwin"
          );
          sqlformat.enable = true;
          stylua.enable = true;
          yamlfmt.enable = true;
        };
        sources.diagnostics = {
          trivy.enable = true;
          yamllint.enable = true;
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
            # php = ["php"];
            # markdown = ["prettierd"];
            nix = ["alejandra"];
            ruby = ["rubyfmt"];
            terraform = ["tofu_fmt"];
            tf = ["tofu_fmt"];
            yaml = ["yamlfmt"];
          };
        };
      };

      lsp = {
        enable = true;
        inlayHints = true;
        keymaps = {
          diagnostic = {
            "<leader>E" = "open_float"; # TODO: fix this
            "[" = "goto_prev";
            "]" = "goto_next";
            "<leader>do" = "setloclist";
          };
          lspBuf = {
            "K" = "hover";
            "gD" = "declaration";
            "gd" = "definition";
            "gr" = "references";
            "gI" = "implementation";
            "gy" = "type_definition";
            "<leader>ca" = "code_action";
            "<leader>cr" = "rename";
            "<leader>wr" = "remove_workspace_folder";
            "<leader>wa" = "add_workspace_folder";
          };
        };
        preConfig = ''
          vim.diagnostic.config({
            virtual_text = false,
            severity_sort = true,
            float = {
              border = 'rounded',
              source = 'always',
            },
          })

          vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
            vim.lsp.handlers.hover,
            {border = 'rounded'}
          )

          vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
            vim.lsp.handlers.signature_help,
            {border = 'rounded'}
          )
        '';
        postConfig = ''
          local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
          for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
          end



          local function list_workspace_folders_notify()
            local folders = vim.lsp.buf.list_workspace_folders()
            if not folders or vim.tbl_isempty(folders) then
              vim.notify("No workspace folders", vim.log.levels.INFO, { title = "Workspace Folders" })
              return
            end

            local seen, uniq = {}, {}
            for _, folder in ipairs(folders) do
              -- normalize the trailing slash so "/foo" and "/foo/" collapse
              local normalized = folder:gsub("/+$", "")
              if normalized == "" then normalized = "/" end
              if not seen[normalized] then
                seen[normalized] = true
                table.insert(uniq, normalized)
              end
            end

            vim.notify(table.concat(uniq, "\n"), vim.log.levels.INFO, { title = "Workspace Folders" })
          end

          vim.keymap.set("n", "<leader>wl", list_workspace_folders_notify, { desc = "List Workspace Folders" })
        '';

        servers = {
          jsonls.enable = true;
          marksman.enable = true;
          # nil_ls.enable = true; # Nix Server
          nixd.enable = true; # Nix Server
          yamlls.enable = true;
          tailwindcss.enable = true;
          taplo.enable = true;
        };
      };

      trouble = {
        enable = true;
      };
    };
  }
