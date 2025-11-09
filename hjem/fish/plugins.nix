{ pkgs, self, ... }:
{
  rum.programs.fish.plugins = {
    inherit (pkgs.fishPlugins) autopair spark tide;

    inherit (self.pins) fish_logo;
  };
}
