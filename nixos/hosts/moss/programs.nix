{ inputs', pkgs, ... }:
{
  development.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    ffmpeg-full
    inputs'.eilmeldung.packages.default
    radeontop
    yt-dlp
  ];
}
