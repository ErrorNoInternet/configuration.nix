{ pkgs, ... }:
{
  development.enable = true;

  environment.systemPackages = with pkgs; [
    lego
  ];
}
