{
  inputs',
  osConfig,
  lib,
  pkgs,
  ...
}:
{
  rum.programs.hypridle = {
    inherit (osConfig.hyprland) enable;

    settings = {
      general = {
        lock_cmd = "noctalia-shell ipc call lockScreen lock";
        before_sleep_cmd = "loginctl lock-session";
      };

      listener = [
        {
          timeout = 10 * 60;
          on-timeout = "loginctl lock-session";
        }

        {
          timeout = 10 * 60;
          on-timeout = "brightnessctl -s s 1%";
          on-resume = "brightnessctl -r";
        }

        {
          timeout = 15 * 60;
          on-timeout = "hyprctl dispatch dpms off";
        }

        {
          timeout = 15 * 60;
          on-timeout = "brightnessctl -d asus::kbd_backlight -s s 0%";
          on-resume = "brightnessctl -d asus::kbd_backlight -r";
        }
      ];
    };
  };

  systemd.services.hypridle = lib.mkIf osConfig.hyprland.enable {
    after = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];
    path = [
      inputs'.noctalia.packages.default
      pkgs.hypridle
    ];
    script = "hypridle";
  };
}
