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
  };

  environment.systemPackages = with pkgs; [
    android-studio
    android-tools
    discord
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
    vesktop
    wechat
    yt-dlp
  ];
}
