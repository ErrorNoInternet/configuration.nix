{ pkgs, ... }:
{
  rum.programs.fish = {
    aliases = {
      H = "ulimit -c (math 1024 x 1024 x 1024) && exec uwsm start ${pkgs.hyprland}/bin/Hyprland";

      cava = "TERM=kitty command cava";
      pwdc = "pwd | tr -d '\n' | wl-copy";

      pp = "playerctl play-pause";
      ppc = "playerctl play";
      ppl = "playerctl -l";
      ppm = "playerctl metadata";
      ppn = "playerctl next";
      ppP = "playerctl position";
      ppp = "playerctl previous";
      pps = "playerctl pause";
      ppS = "playerctl status";
    };

    abbrs = {
      wr = "wf-recorder -f recording_(date \"+%Y-%m-%d_%H:%M:%S\").mp4 -b 0 -c h264_nvenc -p b=8M";
      wra = "wf-recorder -f recording_(date \"+%Y-%m-%d_%H:%M:%S\").mp4 -b 0 -c h264_nvenc -p b=8M -a=alsa_output.pci-0000_00_1b.0.analog-stereo.monitor";
      wrs = "wf-recorder -f recording_(date \"+%Y-%m-%d_%H:%M:%S\").mp4 -b 0 -c h264_nvenc -p b=8M -g (slurp)";
      wrsa = "wf-recorder -f recording_(date \"+%Y-%m-%d_%H:%M:%S\").mp4 -b 0 -c h264_nvenc -p b=8M -a=alsa_output.pci-0000_00_1b.0.analog-stereo.monitor -g (slurp)";

      prun = "prime-run";
    };
  };
}
