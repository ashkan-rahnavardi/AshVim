{
  imports = [
    ./options.nix # Nvim options
    ./keys.nix # Keybinds

    # Magic ~ Autocompletion & lsp stuff
    # ./magic/augment-code.nix # AugmentCode AI coding assistant
    ./magic/cmp.nix #
    ./magic/supermaven.nix # Supermaven inline AI completions
    ./magic/debugging.nix #
    ./magic/lsp.nix #
    ./magic/formatting.nix #
    ./magic/treesitter.nix # Treesitter syntax highlighting and indent
    ./magic/opencode.nix

    # Editor Tools
    ./editor/auto-save.nix # Auto-save buffers proactively
    ./editor/dadbod.nix # Dadbod database UI and completion
    ./editor/gitsigns.nix # Git gutter signs and blame
    ./editor/lazygit.nix # LazyGit terminal interface shortcut
    ./editor/mini.nix # mini.nvim extras (ai, surround, indentscope)
    ./editor/nvim-autopairs.nix # Auto insert matching pairs
    ./editor/obsidian.nix # Obsidian vault integration
    ./editor/render-markdown.nix # Markdown renderer module (disabled)
    ./editor/ts-autotag.nix # Auto close and rename HTML/TSX tags
    ./editor/sops.nix

    # Navigation Tools
    ./nav/dashboard.nix # Alpha dashboard start screen
    ./nav/find.nix # fzf-lua and Telescope search pickers
    ./nav/harpoon.nix # Harpoon quick file navigation marks
    ./nav/oil.nix # Oil buffer-based file explorer
    ./nav/outline.nix # Symbols outline sidebar
    ./nav/todo-comments.nix # Highlight and list TODO-style comments
    ./nav/ufo.nix # UFO folding controls and keymaps
    # ./nav/tmux-navigator.nix # Shared tmux and Neovim pane navigation

    # UI enhancements
    ./ui/bufferline.nix # Bufferline tabline with diagnostics
    ./ui/colorizer.nix # Display color codes inline
    ./ui/illuminate.nix # Highlight other occurrences of word under cursor
    ./ui/lualine.nix # Lualine statusline setup
    ./ui/noice.nix # Noice enhanced command-line and messaging UI
    ./ui/notify.nix # Notify styled notification popups
    # ./ui/nvim-lightbulb.nix # Lightbulb indicator for code actions
    ./ui/themes.nix # Onedark colorscheme configuration
    ./ui/transparent.nix # Transparent background highlight groups
    ./ui/trouble.nix # Trouble diagnostics and lists UI
    ./ui/web-devicons.nix # Filetype glyph icons
    ./ui/snacks.nix
  ];
}
