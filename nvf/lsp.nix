{
  config.vim = {
    lsp.enable = true;

    diagnostics = {
      enable = true;
      config.virtual_text = true;
    };

    keymaps = [
      {
        action = "<Cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>";
        key = "<Leader>I";
        mode = [
          "n"
          "v"
        ];
      }
      {
        action = "<Cmd>lua vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })<CR>";
        key = "<Leader>L";
        mode = [
          "n"
          "v"
        ];
      }
      {
        action = "<Cmd>lua vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })<CR>";
        key = "<Leader>T";
        mode = [
          "n"
          "v"
        ];
      }
    ];
  };
}
