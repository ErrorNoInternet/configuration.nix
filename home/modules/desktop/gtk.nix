{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.toolkits.gtk;
  inherit (lib) mkEnableOption mkOption mkIf strings;
in {
  options.toolkits.gtk = {
    enable = mkEnableOption "";

    theme = mkOption {
      default = {
        name = "Nordic-darker";
        package = pkgs.nordic;
      };
    };

    iconTheme = mkOption {
      default = {
        name = "Colloid-${strings.toLower config.colors.schemeName}-dark";
        package = pkgs.colloid-icon-theme.override {
          schemeVariants = [(strings.toLower config.colors.schemeName)];
        };
      };
    };
  };

  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      inherit (cfg) theme iconTheme;
    };
  };
}
