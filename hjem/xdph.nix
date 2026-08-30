{ lib, osConfig, ... }:
{
  xdg.config.files = lib.mkIf osConfig.hyprland.enable {
    "hypr/xdph.conf".text = /* hyprlang */ ''
      screencopy {
        custom_picker_binary = hyprland-preview-share-picker
      }
    '';
  };
}
