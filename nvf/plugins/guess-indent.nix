{ pkgs, ... }:
{
  config.vim.extraPlugins.guess-indent = {
    package = pkgs.vimPlugins.guess-indent-nvim;
    setup = "require('guess-indent').setup()";
  };
}
