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
