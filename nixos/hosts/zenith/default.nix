{ ... }:
{
  imports = [
    ./hardware.nix
    ./nvidia.nix
    ./programs.nix
    ./storage.nix
    ./usbguard.nix
  ];

  kernel = {
    cachyos = {
      enable = true;
      suffix = "lto-x86_64-v3";
    };

    qol.enable = true;
  };

  libvirt.enable = true;

  time.timeZone = "America/New_York";
}
