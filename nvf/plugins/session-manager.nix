{
  config.vim.session.nvim-session-manager = {
    enable = true;

    setupOpts = {
      autoload_mode = "Disabled";
      autosave_last_session = false;
    };

    mappings = {
      deleteSession = "<Leader>Sd";
      loadLastSession = "<Leader>SL";
      loadSession = "<Leader>Sl";
      saveCurrentSession = "<Leader>Sc";
    };
  };
}
