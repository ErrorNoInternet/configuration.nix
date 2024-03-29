{
  pkgs,
  self',
  ...
}: {
  profiles = {
    windowManager.enable = true;
    desktop = {
      enable = true;
      enableNvidia = true;
    };
  };

  desktop = {
    modifierKey = "ALT";
    monitors = [
      {
        name = "eDP-1";
        width = 1920;
        height = 1080;
        x = 1680;
      }
      {
        name = "VGA-1";
        width = 1680;
        height = 1050;
      }
      {}
    ];
  };

  customPrograms = {
    graphical = {
      discord.enable = true;
      kdeconnect.enable = true;
      libreoffice.enable = true;
      obsStudio.enable = true;
      spotify.enable = true;
      thunderbird.enable = true;
      virtManager.enable = true;
    };
    terminal = {
      cava.enable = true;
      git = {
        user = {
          name = "ErrorNoInternet";
          email = "errornointernet@envs.net";
        };
        signing = {
          key = "2486BFB7B1E6A4A3";
          signByDefault = true;
        };
      };
      gpg = {
        enable = true;
        defaultKey = "2486BFB7B1E6A4A3";
      };
      iamb.enable = true;
      irssi.enable = true;
      nb = {
        enable = true;
        dataDirectory = "/mnt/data/other/nb";
      };
    };
  };

  home.packages = with pkgs; [
    compsize
    ffmpeg_6-full
    firefox
    gimp
    hyprpicker
    imhex
    jetbrains.idea-community
    nvtopPackages.full
    osu-lazer-bin
    prismlauncher
    qbittorrent
    self'.packages.tbw
    superTuxKart
    timg
  ];
}
