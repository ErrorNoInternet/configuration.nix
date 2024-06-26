{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  cfg = config.profiles.locations.china;
  inherit (lib) mkEnableOption mkIf;

  values = (import "${self}/shared/caches/values.nix").locations.china;
in {
  options.profiles.locations.china.enable =
    mkEnableOption "" // {default = true;};

  config = mkIf cfg.enable {
    nix.settings.substituters = values.substituters;

    time.timeZone = "Asia/Shanghai";

    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };

    networking.extraHosts = ''
      185.199.111.133 raw.githubusercontent.com
    '';
  };
}
