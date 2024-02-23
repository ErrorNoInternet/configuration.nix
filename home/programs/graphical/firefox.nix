{
  config,
  inputs,
  lib,
  ...
}: let
  cfg = config.customPrograms.graphical.firefox;
  inherit (lib) mkEnableOption mkIf;
in {
  imports = [inputs.schizofox.homeManagerModule];

  options.customPrograms.graphical.firefox = {
    enable =
      mkEnableOption ""
      // {
        default = config.profiles.desktop.enable;
      };
  };

  config = mkIf cfg.enable {
    programs.schizofox = {
      enable = true;

      theme = {
        colors = with config.colors.scheme.palette; {
          background-darker = "${base00}";
          background = "${base01}";
          foreground = "${base06}";
        };

        font = "JetBrainsMono Nerd Font";
      };
    };
  };
}
