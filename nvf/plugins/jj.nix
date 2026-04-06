{ pkgs, ... }:
{
  config.vim.extraPlugins.jj = {
    package = pkgs.vimPlugins.jj-nvim;
    setup = "require('jj').setup()";
  };
}
