{ inputs', pkgs, ... }:
{
  development.enable = true;
  display.enable = true;
  kmscon = {
    enable = true;
    dpmsTimeout = 6 * 60 * 60;
  };

  environment.systemPackages = with pkgs; [
    ffmpeg-full
    inputs'.eilmeldung.packages.default
    radeontop
    yt-dlp
  ];
}
