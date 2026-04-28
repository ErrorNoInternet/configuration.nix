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
    mkOption
    types
    ;
in
{
  options.graphical = {
    enable = mkEnableOption "";

    repeatDelay = mkOption {
      default = 150;
      type = types.int;
    };

    repeatRate = mkOption {
      default = 50;
      type = types.int;
    };
  };

  config = mkIf cfg.enable {
    fonts.enable = true;
    display.enable = true;

    nix = {
      daemonCPUSchedPolicy = "idle";
      daemonIOSchedClass = "idle";
    };

    xdg.mime.defaultApplications = {
      "application/pdf" = "org.mozilla.firefox.desktop";
      "image/jpeg" = "vimiv.desktop";
      "image/png" = "vimiv.desktop";
      "x-scheme-handler/mailto" = "aerc.desktop";
    };

    users.users.error.extraGroups = [ "pipewire" ];

    services = {
      pipewire = {
        enable = true;
        pulse.enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
      };

      xserver = {
        enable = true;
        excludePackages = [ pkgs.xterm ];
        displayManager.lightdm.enable = false;
      };

      gnome = {
        gnome-keyring.enable = true;
        gcr-ssh-agent.enable = false;
      };

      playerctld.enable = true;
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

    programs = {
      appimage = {
        enable = true;
        binfmt = true;
      };
      dconf.enable = true;
      discord.enable = true;
      firefox.enable = true;
      gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
      kdeconnect.enable = true;
      nix-ld.libraries = [ pkgs.libglvnd ];
    };

    environment = {
      sessionVariables = {
        BROWSER = "firefox";

        GLFW_IM_MODULE = "ibus";
        QT_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
      };

      systemPackages = with pkgs; [
        bibata-cursors
        cava
        ffmpeg-full
        galaxy-buds-client
        glib
        gparted
        grim
        nvtopPackages.full
        pavucontrol
        playerctl
        qalculate-gtk
        ripdrag
        satty
        slurp
        wev
        wlr-randr
        ydotool

        kdePackages.breeze
        kdePackages.breeze.qt5
      ];
    };

    nixpkgs.config.permittedInsecurePackages = [
      "olm-3.2.16"
    ];
  };
}
