{
  config,
  pkgs,
  self,
  ...
}:
{
  age.secrets.ddns.file = "${self}/agenix/ddns.age";

  systemd = {
    timers.ddns = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "5m";
        OnUnitActiveSec = "12h";
        Unit = "ddns.service";
      };
    };

    services.ddns = {
      serviceConfig = {
        EnvironmentFile = config.age.secrets.ddns.path;
        Type = "oneshot";
        User = "root";
      };

      path = with pkgs; [
        curl
        dnsutils
      ];

      script = ''
        IPV4=$(curl -4fsSL ifconfig.me)
        nsupdate -k <(echo $KEY) <<EOF
        server $SERVER
        zone $SERVER
        update delete $HOST A
        update add $HOST 86400 A $IPV4
        send
        EOF
      '';
    };
  };
}
