{ pkgs, ... }:
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
        upnpc -a "$IP" 22 10101 tcp 0 || true
        upnpc -a "$IP" 6984 6984 tcp 0 || true
      '';
    };
  };
}
