{ lib, osConfig, ... }:
let
  inherit (lib) mkBefore;
in
{
  imports = [
    ./aesthetics.nix
    ./binds.nix
    ./colors.nix
    ./graphics.nix
    ./input.nix
    ./monitors.nix
    ./rules.nix
  ];

  rum.desktops.hyprland = {
    enable = osConfig.hyprland.enable;

    settings = {
      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      misc.enable_anr_dialog = false;
    };
  };
}
