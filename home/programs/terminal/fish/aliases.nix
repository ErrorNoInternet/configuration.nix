{
  config,
  lib,
  ...
}: let
  inherit (lib) attrsets strings;
in {
  programs.fish.shellAliases =
    {
      H = "exec Hyprland";
      q =
        (strings.optionalString config.flags.isNixOnDroid
          "if [ \"$SSH_AGENT_LAUNCHED\" = 1 ]; killall ssh-agent; end;")
        + "exit";

      cm = "cmatrix -C blue";
      drg = "ripdrag -xa";
      grep = "grep --color";
      ip = "ip --color";
      lsimg = "timg --grid=6 --upscale --title --center --frames=1";
      py = "python3";
      rgi = "rg -i";
      timg = "timg -pk";
      zrg = "rg -z";
      zrgi = "rg -zi";

      "l@" = "ls -l@";
      "lT@" = "ls -lT@";
      l = "ls -l";
      la = "ls -la";
      laT = "ls -laT";
      li = "ls -li";
      ll = "ls -l";
      lM = "ls -lM";
      ls = "LS_COLORS= eza --icons";
      lT = "ls -lT";
      lTZ = "ls -lTZ";
      lZ = "ls -lZ";

      ff = "fastfetch";
      f = "fastfetch -c ${config.xdg.configHome}/fastfetch/minimal.jsonc";
      droidf = "fastfetch -c ${config.xdg.configHome}/fastfetch/minimal-droid.jsonc";

      B = "nh os boot .";
      Ba = "B -a";
      Bn = "B --no-nom";
      Bna = "B -a --no-nom";
      S = "nh os switch .";
      Sa = "S -a";
      Sn = "S --no-nom";
      Sna = "S -a --no-nom";
      T = "nh os test .";
      Ta = "T -a";
      Tn = "T --no-nom";
      Tna = "T -a --no-nom";

      pp = "playerctl play-pause";
      ppc = "playerctl play";
      ppm = "playerctl metadata";
      ppn = "playerctl next";
      ppP = "playerctl position";
      ppp = "playerctl previous";
      pps = "playerctl pause";
      ppS = "playerctl status";
      pwdc = "pwd | tr -d '\\n' | wl-copy";
    }
    // (attrsets.optionalAttrs config.flags.isNixOnDroid {
      DSa = "DS -a";

      ping = "/android/system/bin/linker64 /android/system/bin/ping";
      ping6 = "/android/system/bin/linker64 /android/system/bin/ping6";
    });
}
