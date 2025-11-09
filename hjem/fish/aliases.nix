{ pkgs, ... }:
{
  rum.programs.fish = {
    aliases = {
      batp = "bat -pp";
      bpy = "bpython";
      fd = "LS_COLORS=1 command fd";
      gcal = "gcal -H '\e[34m:\e[0m:\e[32m:\e[0m'";
      grep = "grep --color";
      ip = "ip --color";
      lowfi = "lowfi -w8";
      lsimg = "timg --grid=6 --upscale --title --center --frames=1";
      objdump = "objdump -Mintel --disassembler-color=on";
      peaclock = "peaclock --config-dir ~/.config/peaclock";
      py = "python3";
      q = "exit";
      rdg = "ripdrag -xa";
      rgi = "rg -i";
      timg = "timg -pk";
      tree = "tree -C";
      tz = "tz -m -w";
      tzq = "tz -q";
      vg = "vgrep";
      zrg = "rg -z";
      zrgi = "rg -zi";
    };

    config = ''
      function ggr -d "fancy git history graph"
        ${pkgs.git-graph}/bin/git-graph --color always -s ascii --no-pager $argv 2>/dev/null | less -R
      end
    '';
  };
}
