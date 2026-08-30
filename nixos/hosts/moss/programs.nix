{ pkgs, ... }:
{
  development.enable = true;
  display.enable = true;
  kmscon = {
    enable = true;
    dpmsTimeout = 0;
  };

  environment.systemPackages = with pkgs; [
    eilmeldung
    ffmpeg-full
    radeontop
    yt-dlp
  ];
}
