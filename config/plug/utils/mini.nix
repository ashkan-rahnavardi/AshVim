{
  plugins.mini = {
    enable = true;
    modules = {
      ai = {};
      comment = {
        options = {
          customCommentString = ''
            <cmd>lua require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring<cr>
          '';
        };
      };
      cursorword = {};
    };
  };
}
