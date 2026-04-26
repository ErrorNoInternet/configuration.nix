{ osConfig, ... }:
{
  imports = [
    ./aesthetics.nix
    ./binds.nix
    ./colors.nix
    ./graphics.nix
    ./input.nix
    ./rules.nix
  ];

  rum.desktops.hyprland = {
    inherit (osConfig.hyprland) enable;

    settings = {
      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      misc = {
        disable_xdg_env_checks = true;
        enable_anr_dialog = false;
      };

      exec-once = [ "noctalia-shell" ];
    };
  };
}
