{ pkgs, ... }:
{
  config.vim = {
    extraPackages = [ pkgs.graphviz ];
    extraPlugins.rustaceanvim.package = pkgs.vimPlugins.rustaceanvim;
  };
}
