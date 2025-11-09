{ pkgs, self', ... }:
{
  imports = [
    ./disko.nix
    ./hardware.nix
    ./nvidia.nix
    ./programs.nix
  ];

  boot.kernelParams = [ "nosgx" ];

  fonts.enable = true;
  wifi.enable = true;
  time.timeZone = "America/New_York";

  hjem.users.error.systemd.services.gamma-control = {
    description = "Modify display color values";
    partOf = [ "wayland-session@Hyprland.target" ];
    wantedBy = [ "wayland-session@Hyprland.target" ];
    script = ''
      pkill -x gamma-control || true
      ${self'.packages.gamma-control}/bin/gamma-control -c 0.4 -b 0.95 -g 1.5
    '';
  };

  host.name = "zenith";
}
