{
  config,
  lib,
  self,
  ...
}:
let
  cfg = config.wireguard;
  inherit (lib)
    mkEnableOption
    mkOption
    mkIf
    types
    ;
in
{
  options.wireguard = {
    server = {
      enable = mkEnableOption "";

      privateKeyFile = mkOption {
        type = types.path;
        default = config.age.secrets.wireguard.path;
      };

      listenPort = mkOption {
        type = types.int;
        default = 51820;
      };
    };
  };

  config = mkIf cfg.server.enable {
    age.secrets.wireguard.file = "${self}/agenix/wireguard.age";

    networking.nat = {
      enable = true;
      enableIPv6 = true;
      externalInterface = "wlan0";
      internalInterfaces = [ "wg0" ];
    };

    networking = {
      firewall.allowedUDPPorts = [ cfg.server.listenPort ];

      wireguard = {
        enable = true;

        interfaces.wg0 = {
          inherit (cfg.server) listenPort privateKeyFile;
          ips = [ "10.0.0.1/24" ];

          peers = [
            {
              name = "Paradigm";
              allowedIPs = [ "10.0.0.2/32" ];
              publicKey = "AZqrfJ+LiQGsdOWm2+EMa5xSwdHYdgA7sgyuUtNNtE4=";
            }
          ];
        };
      };
    };
  };
}
