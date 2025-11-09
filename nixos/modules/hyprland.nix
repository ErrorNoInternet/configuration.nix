{
  config,
  inputs',
  lib,
  pkgs,
  self',
  ...
}:
let
  cfg = config.hyprland;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.hyprland = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    programs = {
      hyprland = {
        enable = true;
        withUWSM = true;
      };
    };

    services.noctalia-shell.enable = true;

    environment.systemPackages = with pkgs; [
      brightnessctl
      hyprpicker
      inputs'.hyprwm-contrib.packages.grimblast
      inputs'.shadower.packages.shadower
      libnotify
      self'.packages.gamma-control
      self'.packages.hyprtoggle
      self'.packages.scratchpad
      vimiv-qt
      wf-recorder
      wl-clipboard

      libsForQt5.qt5.qtgraphicaleffects
      qt6Packages.qt5compat
      quickshell
    ];
  };
}
