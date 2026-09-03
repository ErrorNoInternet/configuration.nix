{
  rum.programs.fish = {
    aliases = {
      cava = "TERM=kitty command cava";
      H = "ulimit -c (math 1024 x 1024 x 1024) && exec uwsm start -e -D Hyprland start-hyprland";
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
      nvo = "nvidia-offload";
    };
  };
}
