{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.graphical;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.graphical = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    fonts.enable = true;

    xdg.mime.defaultApplications = {
      "application/pdf" = "org.mozilla.firefox.desktop";
      "image/jpeg" = "vimiv.desktop";
      "image/png" = "vimiv.desktop";
      "x-scheme-handler/discord" = "vesktop.desktop";
      "x-scheme-handler/mailto" = "aerc.desktop";
    };

    services = {
      gnome = {
        gnome-keyring.enable = true;
        gcr-ssh-agent.enable = false;
      };
    };

    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-gtk
          fcitx5-pinyin-minecraft
          fcitx5-pinyin-zhwiki
          qt6Packages.fcitx5-chinese-addons
        ];
      };
    };

    spicetify.enable = true;

    programs = {
      dconf.enable = true;

      firefox.enable = true;

      gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
    };

    environment.systemPackages = with pkgs; [
      bibata-cursors
      cava
      ffmpeg-full
      galaxy-buds-client
      gimp3-with-plugins
      grim
      nheko
      nvtopPackages.full
      pavucontrol
      playerctl
      qalculate-gtk
      qbittorrent
      ripdrag
      satty
      slurp
      timg
      vesktop
      wechat
      wev

      kdePackages.breeze
      kdePackages.breeze.qt5
    ];

    nixpkgs.config.permittedInsecurePackages = [
      "olm-3.2.16"
    ];
  };
}
