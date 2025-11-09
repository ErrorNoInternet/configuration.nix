{ pkgs, self, ... }:
{
  rum.programs.fish.plugins = {
    inherit (pkgs.fishPlugins) autopair spark tide;

    fish_logo = self.pins.fish_logo;
  };
}
