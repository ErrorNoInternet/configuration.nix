{ osConfig, ... }:
{
  rum.programs.mpv = {
    inherit (osConfig.graphical) enable;

    config = {
      no-keepaspect-window = "";

      demuxer-max-back-bytes = "50MiB";
      demuxer-max-bytes = "200MiB";

      sub-scale = 0.4;
      ytdl-raw-options = "write-auto-sub=";

      hwdec = "auto";
    };
  };
}
