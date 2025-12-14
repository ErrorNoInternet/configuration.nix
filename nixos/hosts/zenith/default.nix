{ ... }:
{
  imports = [
    ./hardware.nix
    ./nvidia.nix
    ./programs.nix
    ./storage.nix
    ./usbguard.nix
  ];

  kernel.bore = true;
  time.timeZone = "America/New_York";
}
