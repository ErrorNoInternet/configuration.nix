{ osConfig, pkgs, ... }:
{
  rum.programs.mpv = {
    inherit (osConfig.display) enable;

    scripts = with pkgs.mpvScripts; [
      mpris
      sponsorblock
      videoclip
    ];

    scriptOpts = {
      videoclip = {
        audio_bitrate = "64k";
        preset = "medium";
        use_ffmpeg = true;
        video_bitrate = "4M";
        video_height = 720;
      };
    };

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
