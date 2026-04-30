{
  config,
  inputs',
  lib,
  pkgs,
  self',
  self,
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

      gpu-screen-recorder.enable = true;
    };

    environment.systemPackages = with pkgs; [
      (vimiv-qt.overrideAttrs (_: {
        src = self.pins.vimiv-qt;
      }))

      hyprpicker
      inputs'.hyprwm-contrib.packages.grimblast
      inputs'.shadower.packages.shadower
      libnotify
      self'.packages.gamma-control
      self'.packages.hyprtoggle
      self'.packages.scratchpad
      wf-recorder
      wl-clipboard

      inputs'.noctalia.packages.default
      libsForQt5.qt5.qtgraphicaleffects
      qt6.qt5compat
      qt6.qtimageformats
      quickshell
    ];
  };
}
