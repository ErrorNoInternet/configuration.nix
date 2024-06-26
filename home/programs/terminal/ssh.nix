{
  config,
  lib,
  ...
}: let
  cfg = config.customPrograms.ssh;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.ssh.enable =
    mkEnableOption "" // {default = true;};

  config = mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent =
        if config.flags.isNixOnDroid
        then "6h"
        else "1d";
    };
    services.ssh-agent.enable = true;
  };
}
