{ lib, ... }:
let
  toDesktop =
    attrs:
    lib.generators.toINI { } {
      "Desktop Entry" = attrs;
    };
in
{
  xdg.data.files = {
    "applications/hyprpicker.desktop".text = toDesktop {
      Name = "hyprpicker";
      Comment = " A Wayland color picker";
      Keywords = "Color;Picker";
      Categories = "Development;Graphics;System;Utility";
      Type = "Application";
      Icon = "utilities-terminal";
      Exec = "hyprpicker -a";
    };

    "applications/lowfi.desktop".text = toDesktop {
      Name = "lowfi";
      Comment = "Launches the lowfi music player";
      Keywords = "Audio;Music;Lofi";
      Categories = "Audio;Music;Player;AudioVideo";
      Type = "Application";
      Icon = "utilities-terminal";
      Exec = "kitty --class lowfi lowfi -abmw8";
    };
  };
}
