{
  inputs',
  pkgs,
  ...
}:
{
  environment.persistence."/persist".files = [
    "/var/lib/cups/printers.conf"
  ];

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      brlaser
      hplip
    ];
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
    exfatprogs
    gimp3-with-plugins
    iamb
    imhex
    inputs'.concord.packages.default
    inputs'.eilmeldung.packages.default
    jetbrains.idea-oss
    libreoffice-fresh
    lsfg-vk
    lsfg-vk-ui
    newsboat
    nheko
    nix-init
    obsidian
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
