{
  config,
  lib,
  pkgs,
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

    boot.kernel.sysctl."net.ipv4.ip_forward" = 1;

    upnp.udpPorts = [ cfg.server.listenPort ];
    networking = {
      firewall.allowedUDPPorts = [ cfg.server.listenPort ];

      wireguard = {
        enable = true;

        interfaces.wg0 =
          let
            interface = "wlan0";
          in
          {
            inherit (cfg.server) listenPort privateKeyFile;
            ips = [ "10.0.0.1/24" ];

            postSetup = ''
              ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o ${interface} -j MASQUERADE
            '';
            postShutdown = ''
              ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.0.0.0/24 -o ${interface} -j MASQUERADE
            '';

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
