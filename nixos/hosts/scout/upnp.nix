{ lib, pkgs, ... }:
{
  systemd = {
    timers.upnp = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "5m";
        OnUnitActiveSec = "12h";
        Unit = "upnp.service";
      };
    };

    services.upnp = {
      serviceConfig = {
        Type = "oneshot";
        User = "root";
      };

      path = with pkgs; [
        gawk
        hostname
        miniupnpc
      ];

      script = ''
        IP=$(hostname -I | awk '{print $1}')
      ''
      + lib.concatStringsSep "\n" (
        map (port: "upnpc -a \"$IP\" ${port} ${port} tcp 0 || true") (
          map (port: builtins.toString port) [
            22
            6984
            18080
          ]
        )
      );
    };
  };
}
