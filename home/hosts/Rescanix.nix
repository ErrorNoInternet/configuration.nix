{
  inputs',
  pkgs,
  self',
  ...
}: {
  caches.nix-gaming.enable = true;

  profiles = {
    windowManager.enable = true;
    desktop = {
      enable = true;
      enableNvidia = true;
    };
  };

  desktop.monitors = [{}];

  home.programs = {
    graphical = {
      kdeconnect.enable = true;
      libreoffice.enable = true;
      nheko.enable = true;
      obsStudio.enable = true;
      spotify.enable = true;
      thunderbird.enable = true;
      virtManager.enable = true;
    };

    terminal = {
      cava.enable = true;
      git.enable = true;
      gpg.enable = true;
      irssi.enable = true;
    };
  };

  home = {
    username = "error";
    homeDirectory = "/home/error";
    packages = with pkgs; [
      (hashcat.override {cudaSupport = true;})
      _7zz
      amdgpu_top
      bandwhich
      blender
      brave
      compsize
      cpu-x
      ddrescue
      dmidecode
      drm_info
      duf
      duperemove
      efibootmgr
      efivar
      ffmpeg_6-full
      fio
      firefox
      geekbench
      gimp
      gparted
      gptfdisk
      hyperfine
      hyprpicker
      imagemagick
      inputs'.hyprwm-contrib.packages.scratchpad
      inputs'.nix-gaming.packages.osu-lazer-bin
      inputs'.nix-gaming.packages.wine-ge
      inputs'.overmask.packages.overmask
      intel-gpu-tools
      iperf
      kdiskmark
      linuxPackages_latest.perf
      lm_sensors
      lshw
      mangohud
      mesa-demos
      multipath-tools
      nmap
      nvme-cli
      nvtop
      ookla-speedtest
      parted
      patchelf
      pavucontrol
      pciutils
      powertop
      prismlauncher
      procs
      pv
      qrencode
      radeontop
      sdparm
      self'.packages.passgen
      self'.packages.savehw
      self'.packages.tbw
      smartmontools
      sqlite
      sshfs
      steam-run
      superTuxKart
      sysstat
      timg
      tree
      unigine-heaven
      usbutils
      util-linux
      virt-manager
      vulkan-tools
      wl-screenrec
      zbar
    ];
  };
}
