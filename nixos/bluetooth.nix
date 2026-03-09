{ lib, ... }:
let
  inherit (lib) mkDefault;
in
{
  hardware.bluetooth.enable = mkDefault true;
  services.blueman.enable = mkDefault true;

  hjem.users.error.systemd.services."app-blueman@autostart".enable = false;
}
