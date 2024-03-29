{
  config,
  lib,
  pkgs,
  self',
  ...
}: let
  cfg = config.workstation.sddm;
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.sddm.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    services.xserver.displayManager.sddm = {
      enable = true;
      theme = "${self'.packages.sddmTheme-corners}";
    };

    environment.systemPackages = with pkgs; [
      libsForQt5.qt5.qtgraphicaleffects
    ];
  };
}
