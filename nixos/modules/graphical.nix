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
      "image/*" = "vimiv.desktop";
      "x-scheme-handler/mailto" = "aerc.desktop";
    };

    users.users.error.extraGroups = [ "pipewire" ];

    security.pam.services.ly.enableGnomeKeyring = true;

    services = {
      displayManager.ly = {
        enable = true;

        settings = {
          animation = "colormix";
          brightness_down_cmd = "${pkgs.brightnessctl}/bin/brightnessctl -q -n -d intel_backlight s 5%-";
          brightness_up_cmd = "${pkgs.brightnessctl}/bin/brightnessctl -q -n -d intel_backlight s +5%";
          clock = "%c";
          colormix_col1 = "0x005277C3";
          colormix_col2 = "0x007EBAE4";
          colormix_col3 = "0x205277C3";
          corner_bottom_left = "";
          corner_top_left = "";
          default_input = "password";
          save_file_dir = "/var/lib/ly";
          session_log = ".local/state/ly-session.log";
        };
      };

      pipewire = {
        enable = true;
        pulse.enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
      };

      udev.extraRules = ''
        ACTION=="add", SUBSYSTEM=="sound", KERNEL=="controlC*", ATTRS{idVendor}=="001f", ATTRS{idProduct}=="0b21", RUN+="/bin/sh -c 'sleep 1; ${pkgs.alsa-utils}/bin/amixer -c %n -q cset numid=4 4096'"
      '';

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
      etc."xdg/wireplumber/wireplumber.conf.d/99-ab13x-headset.conf".text = ''
        monitor.alsa.rules = [
          {
            matches = [
              { device.name = "alsa_card.usb-Generic_AB13X_USB_Audio_20210726905926-00" }
            ]
            actions = { update-props = { api.alsa.soft-mixer = true } }
          }
        ]
      '';

      persistence."/persist" = {
        directories = [
          "/var/lib/ly"
        ];
      };

      sessionVariables = {
        BROWSER = "firefox";

        GLFW_IM_MODULE = "ibus";
        QT_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
      };

      systemPackages = with pkgs; [
        alsa-utils
        bibata-cursors
        cava
        exiftool
        ffmpeg-full
        galaxy-buds-client
        glib
        gparted
        grim
        intel-gpu-tools
        kdePackages.breeze
        kdePackages.breeze.qt5
        libva-utils
        mesa-demos
        nvtopPackages.full
        osc
        pavucontrol
        playerctl
        pulseaudio
        qalculate-gtk
        ripdrag
        satty
        slurp
        trash-cli
        vulkan-tools
        wev
        wlr-randr
        xdg-user-dirs
        ydotool
      ];
    };

    nixpkgs.config.permittedInsecurePackages = [
      "olm-3.2.16"
    ];
  };
}
