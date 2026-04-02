{ inputs', pkgs, ... }:
{
  development.enable = true;

  environment.systemPackages = with pkgs; [
    inputs'.eilmeldung.packages.default
    radeontop
  ];
}
