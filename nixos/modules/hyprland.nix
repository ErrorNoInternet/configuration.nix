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
    mkOption
    types
    ;
in
{
  options.hyprland = {
    enable = mkEnableOption "";

    monitors = mkOption {
      default = [ ];
      type = types.listOf (
        types.submodule {
          options = {
            output = mkOption { type = types.str; };
            mode = mkOption {
              type = types.str;
              default = "preferred";
            };
            position = mkOption {
              type = types.str;
              default = "auto";
            };
            scale = mkOption {
              type = types.raw;
              default = 1;
            };
            extra = mkOption {
              type = types.attrsOf types.raw;
              default = { };
            };
          };
        }
      );
    };
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

      gpu-screen-recorder-gtk
      hyprpicker
      inputs'.hyprwm-contrib.packages.grimblast
      libnotify
      self'.packages.gamma-control
      self'.packages.scratchpad
      wl-clipboard
      wl-screenrec

      kdePackages.kimageformats
      qt5.qtgraphicaleffects
      qt5.qtimageformats
      qt6.qt5compat
      qt6.qtimageformats
      quickshell
    ];
  };
}
