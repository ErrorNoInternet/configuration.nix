{ self, ... }:
{
  imports = [
    ./hardware.nix
    ./nvidia.nix
    ./programs.nix
    ./storage.nix
    ./usbguard.nix
  ];

  time.timeZone = "America/New_York";

  host.name = "zenith";
}
