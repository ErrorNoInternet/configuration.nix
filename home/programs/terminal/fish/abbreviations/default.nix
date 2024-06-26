{config, ...}: {
  imports = [
    ./git.nix
    ./mullvad.nix
    ./nix.nix
    ./zfs.nix
  ];

  programs.fish.shellAbbrs =
    {
      "...." = "../..";
      "......" = "../../..";
      "........" = "../../../..";
      ".........." = "../../../../..";
      "............" = "../../../../../..";

      c = "cd ${
        if config.flags.isNixOnDroid
        then "~/.config/nixpkgs"
        else "/etc/nixos"
      }/configuration.nix";

      "-" = "cd -";
      b = "bat";
      bt = "btop";
      cl = "curl -L";
      clo = "curl -LO";
      clO = "curl -Lo";
      d = "cd ~/data";
      dl = "cd ~/downloads";
      dm = "dmesg";
      dmt = "dmesg -T";
      dmtw = "dmesg -Tw";
      dmw = "dmesg -w";
      e = "echo";
      ex = "exec";
      jr = "journalctl";
      m = "man";
      mk = "make";
      p = "ping";
      pa = "patch -p1";
      pf = "printf";
      s = "sudo";
      sc = "systemctl";
      scu = "systemctl --user";
      sl = "sleep";
      t = "tmux";
      v = "nvim";

      ios = "iostat --human 1";
      ios3 = "iostat --human 3";
      iot = "sudo iotop-c";
      pds = "pidstat --human -d 1";
      pds3 = "pidstat --human -d 3";
      spds = "sudo pidstat --human -d 1";
      spds3 = "sudo pidstat --human -d 3";

      hy = "hyprctl";
      nv = "nvidia-offload";
    }
    // (let
      wf-recorder = "wf-recorder -b 0 -c h264_nvenc -p b=5M -f recording_(date \"+%Y-%m-%d_%H:%M:%S\").mp4";
    in {
      wr = wf-recorder;
      wra = "${wf-recorder} -a=alsa_output.pci-0000_00_1b.0.analog-stereo.monitor";
      wrs = "${wf-recorder} -g (slurp)";
      wrsa = "${wf-recorder} -a=alsa_output.pci-0000_00_1b.0.analog-stereo.monitor -g (slurp)";
    });
}
