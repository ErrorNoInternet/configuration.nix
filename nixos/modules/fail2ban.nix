{ config, lib, ... }:
let
  cfg = config.fail2ban;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.fail2ban = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    networking.firewall.logRefusedConnections = false;

    services.fail2ban = {
      enable = true;

      maxretry = 6;
      bantime = "5m";
      bantime-increment = {
        enable = true;
        multipliers = "1 2 6 24 288 864 2016 8640";
        rndtime = "5m";
      };

      jails = {
        DEFAULT.settings.findtime = "15m";

        sshd = lib.mkForce ''
          enabled = true
          mode = aggressive
          port = ${lib.strings.concatMapStringsSep "," toString config.services.openssh.ports}
        '';
      };
    };
  };
}
