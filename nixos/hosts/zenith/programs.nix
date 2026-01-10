{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      brlaser
      hplip
    ];
  };

  development.enable = true;
  gaming.enable = true;
  graphical.enable = true;
  hyprland.enable = true;

  programs = {
    aerc.enable = true;
    btop.variant = "cuda";
    irssi.enable = true;
  };

  environment.systemPackages = with pkgs; [
    android-tools
    discord
    libreoffice-fresh
    newsboat
    scrcpy
  ];
}
