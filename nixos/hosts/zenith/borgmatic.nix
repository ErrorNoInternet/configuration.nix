{ config, self, ... }: {
  age.secrets =
    let
      inherit (config.host) name;
    in
    {
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
          path = "ssh://error@bastion.error.tuxcord.net//mnt/backups/borg/zenith";
        }
      ];

      patterns_from = [ config.age.secrets.borgPatterns.path ];
      exclude_from = [ config.age.secrets.borgExclude.path ];
      encryption_passcommand = "cat ${config.age.secrets.borgPassphrase.path}";

      compression = "zstd,9";
      exclude_caches = true;
      exclude_if_present = [ ".nobackup" ];
      one_file_system = true;
      ssh_command = "ssh -i /etc/ssh/ssh_host_ed25519_key";

      keep_weekly = 4;
      keep_monthly = 6;
      keep_3monthly = 12;

      progress = true;
      statistics = true;
    };
  };
}
