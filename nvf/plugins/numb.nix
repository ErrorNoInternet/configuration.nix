{ pkgs, ... }:
{
  config.vim.extraPlugins.numb = {
    package = pkgs.vimPlugins.numb-nvim;
    setup = "require('numb').setup()";
  };
}
