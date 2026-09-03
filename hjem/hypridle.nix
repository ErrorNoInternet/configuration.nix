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
        lock_cmd = "noctalia msg session lock";
        before_sleep_cmd = "loginctl lock-session";
      };

      listener = [
        {
          timeout = 10 * 60;
          on-timeout = "loginctl lock-session";
        }

        {
          timeout = 15 * 60;
          on-timeout = "noctalia msg dpms-off";
        }
      ];
    };
  };

  systemd.services.hypridle = lib.mkIf osConfig.hyprland.enable {
    after = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];
    path = with pkgs; [
      hypridle
      inputs'.noctalia.packages.default
    ];
    script = "hypridle";
  };
}
