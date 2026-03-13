{
  config.vim.filetree.nvimTree = {
    enable = true;

    openOnSetup = false;

    setupOpts = {
      diagnostics = {
        enable = true;
        show_on_dirs = true;
      };

      view = {
        width = 32;
        signcolumn = "no";
      };
    };

    mappings = {
      toggle = "tt";
    };
  };
}
