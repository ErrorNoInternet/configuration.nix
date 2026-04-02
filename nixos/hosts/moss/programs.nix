{ inputs', pkgs, ... }:
{
  development.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    inputs'.eilmeldung.packages.default
    radeontop
    yt-dlp
  ];
}
