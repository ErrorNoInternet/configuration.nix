{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.customPrograms.gpg;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.customPrograms.gpg = {
    enable = mkEnableOption "";

    defaultKey = mkOption {
      type = with types; nullOr str;
      default = null;
    };
  };

  config = mkIf cfg.enable {
    programs.gpg = {
      enable = true;
      settings = {
        keyserver = "hkps://keyserver.ubuntu.com";
        default-key = mkIf (cfg.defaultKey != null) cfg.defaultKey;
      };
    };
    services.gpg-agent = {
      enable = true;
      enableFishIntegration = true;

      defaultCacheTtl = 86400;
      maxCacheTtl = 86400;
      pinentryPackage = pkgs.pinentry-curses;
      verbose = true;
    };
    home.file.".gnupg/dirmngr.conf".text = ''
      standard-resolver
    '';
  };
}
