{lib, ...}:
lib.mkMerge [
  {
    plugins.lsp = {
      enable = true;
      inlayHints = true;
      keymaps = {
        diagnostic = {
          # "<leader>E" = "open_float";
          "[" = "goto_prev";
          "]" = "goto_next";
          "<leader>do" = "setloclist";
        };
        lspBuf = {
          "K" = "hover";
          "gD" = "declaration";
          # "gd" = "definition";
          # "gr" = "references";
          # "gI" = "implementation";
          # "gy" = "type_definition";
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
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = " ",
              [vim.diagnostic.severity.WARN] = " ",
              [vim.diagnostic.severity.HINT] = " ",
              [vim.diagnostic.severity.INFO] = " ",
            },
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
        local function list_workspace_folders_notify()
          local folders = vim.lsp.buf.list_workspace_folders()
          if not folders or vim.tbl_isempty(folders) then
            vim.notify("No workspace folders", vim.log.levels.INFO, { title = "Workspace Folders" })
            return
          end

          local seen, uniq = {}, {}
          for _, folder in ipairs(folders) do
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

      # TODO: lighten up default lsp
      servers = {
        jsonls.enable = true;
        marksman.enable = true;
        nixd.enable = true;
        yamlls.enable = true;
        taplo.enable = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>cd";
        action = "<CMD>lua vim.diagnostic.open_float()<CR>";
        options.desc = "Popup Diagnostics";
      }
    ];
  }
  {
    plugins.which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>c";
        group = "Code Actions";
        icon = "";
      }
      {
        __unkeyed-1 = "<leader>ca";
        icon = "󱐋";
        desc = "Code Actions";
      }
      {
        __unkeyed-1 = "<leader>cr";
        icon = "󰑕";
        desc = "Rename";
      }
      {
        __unkeyed-1 = "<leader>w";
        group = "Workspace";
        icon = "💼";
      }
      {
        __unkeyed-1 = "<leader>wa";
        icon = "󱑾";
        desc = "Add Workspace Folder";
      }
      {
        __unkeyed-1 = "<leader>wr";
        icon = "";
        desc = "Remove Workspace Folder";
      }
      {
        __unkeyed-1 = "<leader>wl";
        icon = "󰉓";
        desc = "List Workspace Folders";
      }
    ];
  }
]
