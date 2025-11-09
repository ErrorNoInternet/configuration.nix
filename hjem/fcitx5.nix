{
  lib,
  osConfig,
  self,
  ...
}:
let
  inherit (osConfig.scheme) slug;
  themeName = if slug == "kanagawa" then "OriKanagawa" else "OriNord";
in
{
  xdg.config.files =
    with lib.generators;
    lib.mkIf osConfig.graphical.enable {
      "fcitx5/profile".text = toINI { } {
        "Groups/0" = {
          Name = "Default";
          "Default Layout" = "us";
          DefaultIM = "pinyin";
        };

        "Groups/0/Items/0" = {
          Name = "keyboard-us";
          Layout = "";
        };

        "Groups/0/Items/1" = {
          Name = "pinyin";
          Layout = "";
        };

        GroupOrder = {
          "0" = "Default";
        };
      };

      "fcitx5/config".text = toINI { } {
        "Hotkey/TriggerKeys" = {
          "0" = "Super+space";
        };
      };

      "fcitx5/conf/classicui.conf".text = toINIWithGlobalSection { } {
        globalSection = {
          PreferTextIcon = "True";
          Theme = themeName;
        };
      };
    };

  xdg.data.files = lib.mkIf osConfig.graphical.enable {
    "fcitx5/themes/${themeName}".source = "${self.pins.Ori-fcitx5}/${themeName}";
  };
}
