{ ... }:
{
  imports = [
    ./hardware.nix
    ./nvidia.nix
    ./programs.nix
    ./storage.nix
    ./usbguard.nix
  ];

  substituters.caches.fenix.enable = true;

  kernel = {
    cachyos = {
      enable = true;
      suffix = "lto-x86_64-v3";
    };

    qol.enable = true;
  };

  libvirt.enable = true;

  time.timeZone = "Asia/Shanghai";
}
