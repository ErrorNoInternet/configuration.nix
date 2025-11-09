{
  rum.programs.fish = {
    abbrs = {
      "-" = "cd -";
      ae = "aerc";
      b = "bat";
      bp = "batp";
      bt = "btop";
      c = "cat";
      cl = "curl -L";
      clO = "curl -Lo";
      clo = "curl -LO";
      dl = "cd ~/downloads";
      dm = "sudo dmesg";
      dmt = "sudo dmesg -T";
      dmtw = "sudo dmesg -Tw";
      dmw = "sudo dmesg -w";
      e = "echo";
      ex = "exec";
      F = "fastfetch";
      f = "fg";
      gz = "gzip";
      gzd = "gzip -d";
      ht = "htop";
      hy = "hyprctl";
      ios = "iostat --human 1";
      ios3 = "iostat --human 3";
      iosx = "iostat -x --human 1";
      iosx3 = "iostat -x --human 3";
      iot = "sudo iotop-c";
      lsb = "lsblk";
      lsbf = "lsblk -f";
      m = "man";
      md = "mkdir";
      mdp = "mkdir -p";
      mk = "make";
      mkc = "make clean";
      mt = "neomutt";
      nw = "newsboat";
      objd = "objdump -d";
      p = "ping";
      pa = "patch -p1";
      pc = "peaclock";
      pcb = "peaclock --config ~/.config/peaclock/binary";
      pds = "pidstat --human -d 1";
      pds3 = "pidstat --human -d 3";
      pf = "printf";
      pk = "pkill";
      qc = "qalc";
      rd = "rmdir";
      rdp = "rmdir -p";
      s = "sudo";
      se = "sudoedit";
      sl = "sleep";
      spds = "sudo pidstat --human -d 1";
      spds3 = "sudo pidstat --human -d 3";
      sr = "songrec r -d \"Monitor of HUAWEI USB-C HEADSET Pro\"";
      srl = "songrec l -d \"Monitor of HUAWEI USB-C HEADSET Pro\"";
      st = "strace";
      t = "tmux";
      una = "uname -a";
      up = "uptime";
      upp = "uptime -p";
      ups = "uptime -s";
      v = "nvim";
      vm = "vimiv";
      wlc = "wl-copy";
      wlp = "wl-paste";
      wlpga = "wl-paste | git apply";
    };

    config = ''
      abbr -a dotdot -r '^\.\.+$' -f multicd
    '';
  };
}
