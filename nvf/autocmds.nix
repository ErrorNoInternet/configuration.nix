{
  config.vim.autocmds = [
    {
      command = "set number";
      event = [ "TermOpen" ];
      pattern = [ "*" ];
    }
    {
      command = "startinsert";
      event = [ "TermOpen" ];
      pattern = [ "*" ];
    }
  ];
}
