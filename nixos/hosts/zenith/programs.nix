{ pkgs, ... }:
{
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
    newsboat
  ];
}
