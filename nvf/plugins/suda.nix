{ pkgs, ... }:
{
  config.vim = {
    extraPlugins.suda.package = pkgs.vimPlugins.vim-suda;

    globals.suda_smart_edit = 1;
  };
}
