{ ... }:
{
  imports = [
    ./graphics.nix
    ./hardware.nix
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

  boot.kernel.sysctl."vm.swappiness" = 60;

  libvirt.enable = true;

  services.resolved.settings.Resolve.DNSOverTLS = false;

  time.timeZone = "Asia/Shanghai";
}
