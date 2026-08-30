{
  inputs',
  pkgs,
  ...
}:
{
  environment.persistence."/persist".files = [
    "/var/lib/cups/printers.conf"
  ];

  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [
        brlaser
        hplip
      ];
    };

    hardware.openrgb = {
      enable = true;
      package = pkgs.openrgb-with-all-plugins;
    };
  };

  users.users.error.extraGroups = [
    "wireshark"
  ];

  development = {
    enable = true;
    java.enable = true;
  };
  gaming.enable = true;
  graphical.enable = true;
  hyprland.enable = true;
  kmscon.enable = true;
  spicetify.enable = true;

  programs = {
    aerc.enable = true;
    btop.variant = "cuda";

    clash-verge = {
      enable = true;
      serviceMode = true;
      tunMode = true;
    };

    irssi.enable = true;

    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };

    sbox = {
      enable = true;
      shellHook = ''
        export fish_greeting=
        export FISH_THEME_CONFIGURED=1
        export SHELL=bash
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    android-file-transfer
    android-studio
    android-tools
    codex
    distrobox
    duperemove
    eilmeldung
    exfatprogs
    gimp3-with-plugins
    iamb
    imhex
    inputs'.concord.packages.default
    jetbrains.idea
    libreoffice-stable
    lsfg-vk
    lsfg-vk-ui
    newsboat
    nheko
    nix-init
    obsidian
    opencode
    oxipng
    qbittorrent
    qpwgraph
    scrcpy
    songrec
    sqlit-tui
    stress-ng
    wechat
    wireguard-tools
    yt-dlp
  ];
}
