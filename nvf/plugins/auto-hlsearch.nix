{ pkgs, ... }:
{
  config.vim.extraPlugins.auto-hlsearch = {
    package = pkgs.vimPlugins.auto-hlsearch-nvim;
    setup = "require('auto-hlsearch').setup()";
  };
}
