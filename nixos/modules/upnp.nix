{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.upnp;
  inherit (lib)
    mkEnableOption
    mkIf
    mkOption
    types
    ;
in
{
  options.upnp = {
    enable = mkEnableOption "";

    tcpPorts = mkOption {
      type = types.listOf types.int;
    };

    udpPorts = mkOption {
      type = types.listOf types.int;
    };
  };

  config = mkIf cfg.enable {
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

        script =
          let
            mkPorts =
              protocol:
              map (port: "upnpc -z 1900 -a \"$IP\" ${port} ${port} ${protocol} 0 || true") (
                map (port: builtins.toString port) cfg."${protocol}Ports"
              );
          in
          ''
            IP=$(hostname -I | awk '{print $1}')
          ''
          + lib.concatStringsSep "\n" (mkPorts "tcp" ++ mkPorts "udp");
      };
    };
  };
}
