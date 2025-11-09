{ pkgs, ... }:
{
  gaming.enable = true;
  graphical.enable = true;
  hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    newsboat
    prismlauncher
  ];
}
