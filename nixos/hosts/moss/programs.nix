{ pkgs, ... }:
{
  development.enable = true;
  graphical.enable = true;
  hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    radeontop
  ];
}
