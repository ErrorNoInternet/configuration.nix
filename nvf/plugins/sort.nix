{ pkgs, ... }:
{
  config.vim.extraPlugins.sort-motion = {
    package = pkgs.vimPlugins.sort-nvim;
    setup = "require('sort').setup()";
  };
}
