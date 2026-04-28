{ inputs', pkgs, ... }:
{
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      brlaser
      hplip
    ];
  };

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
    irssi.enable = true;
    wireshark.enable = true;

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
    android-studio
    android-tools
    distrobox
    duperemove
    gimp3-with-plugins
    imhex
    inputs'.eilmeldung.packages.default
    jetbrains.idea-oss
    libreoffice-fresh
    lsfg-vk
    lsfg-vk-ui
    newsboat
    nheko
    obsidian
    oxipng
    qbittorrent
    qpwgraph
    scrcpy
    songrec
    wechat
    yt-dlp
  ];
}
