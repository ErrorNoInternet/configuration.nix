{ inputs', pkgs, ... }:
{
  display.enable = true;
  development.enable = true;

  environment.systemPackages = with pkgs; [
    ffmpeg-full
    inputs'.eilmeldung.packages.default
    radeontop
    yt-dlp
  ];
}
