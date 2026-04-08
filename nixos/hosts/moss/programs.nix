{ inputs', pkgs, ... }:
{
  development.enable = true;
  display.enable = true;
  kmscon.enable = true;

  environment.systemPackages = with pkgs; [
    ffmpeg-full
    inputs'.eilmeldung.packages.default
    radeontop
    yt-dlp
  ];
}
