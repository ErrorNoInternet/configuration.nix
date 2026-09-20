{
  config,
  lib,
  pkgs,
  self,
  ...
}:
let
  cfg = config.borgmatic;
  inherit (lib)
    mkEnableOption
    mkIf
    mkOption
    types
    ;
in
{
  options.borgmatic = {
    enable = mkEnableOption "";

    compression = mkOption {
      default = "zstd,9";
      type = types.str;
    };
  };

  config =
    let
      inherit (config.host) name;
    in
    mkIf cfg.enable {
      age.secrets = {
        borgExclude.file = "${self}/agenix/borg/${name}/exclude.age";
        borgPassphrase.file = "${self}/agenix/borg/${name}/passphrase.age";
        borgPatterns.file = "${self}/agenix/borg/${name}/patterns.age";
      };

      services.borgmatic = {
        enable = true;

        configurations.bastion = {
          repositories = [
            {
              label = "bastion";
              path = "ssh://error@bastion.error.tuxcord.net//mnt/backups/borg/${name}";
            }
          ];

          patterns_from = [ config.age.secrets.borgPatterns.path ];
          exclude_from = [ config.age.secrets.borgExclude.path ];
          encryption_passcommand = "cat ${config.age.secrets.borgPassphrase.path}";

          inherit (cfg) compression;
          exclude_caches = true;
          exclude_if_present = [ ".nobackup" ];
          one_file_system = true;
          ssh_command = "ssh -i /etc/ssh/ssh_host_ed25519_key";

          keep_daily = 7;
          keep_weekly = 4;
          keep_monthly = 6;
          keep_3monthly = 12;

          progress = true;
          statistics = true;
        };
      };

      environment.systemPackages = [ pkgs.borgbackup ];
    };
}
