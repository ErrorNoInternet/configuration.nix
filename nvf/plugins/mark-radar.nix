{ pkgs, ... }:
{
  config.vim = {
    extraPlugins.mark-radar = {
      package = pkgs.vimPlugins.mark-radar-nvim;
      setup = "require('mark-radar').setup()";
    };

    highlight = {
      RadarMark.link = "@keyword.exception";
    };
  };
}
