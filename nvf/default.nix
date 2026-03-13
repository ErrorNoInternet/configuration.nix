{
  imports = [
    ./autocmds.nix
    ./filetypes.nix
    ./helpers.nix
    ./highlights.nix
    ./languages.nix
    ./lsp.nix
    ./options.nix
    ./plugins
    ./runner.nix
    ./theme.nix
  ];

  config.vim = {
    viAlias = false;
    vimAlias = false;

    luaConfigRC.aunmenu = ''
      vim.cmd.aunmenu("PopUp.-2-")
      vim.cmd.aunmenu("PopUp.How-to\\ disable\\ mouse")
    '';
  };
}
