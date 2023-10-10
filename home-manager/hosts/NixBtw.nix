{ config, inputs, pkgs, ... }:

let
  custom = {
    font = "JetBrainsMono Nerd Font";
    opacity = ".7";
    subtleOpacity = ".9";
    pointerCursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 16;
    };
    gtkTheme = {
      name = "Colloid-Dark-Nord";
      package = pkgs.colloid-gtk-theme.override { tweaks = [ "nord" ]; };
    };
    gtkIconTheme = {
      name = "Colloid-nord-dark";
      package = pkgs.colloid-icon-theme.override { schemeVariants = [ "nord" ]; };
    };
  };
in
{
  _module.args = { inherit custom; };
  imports = [
    ../modules/bat.nix
    ../modules/btop.nix
    ../modules/cava.nix
    ../modules/desktop-entries.nix
    ../modules/dunst.nix
    ../modules/fastfetch.nix
    ../modules/fcitx.nix
    ../modules/git.nix
    ../modules/gtk.nix
    ../modules/hyprland-autoname-workspaces.nix
    ../modules/hyprland.nix
    ../modules/irssi.nix
    ../modules/kdeconnect.nix
    ../modules/kitty.nix
    ../modules/libreoffice.nix
    ../modules/mpv.nix
    ../modules/neovim.nix
    ../modules/nheko.nix
    ../modules/obs-studio.nix
    ../modules/rofi.nix
    ../modules/thunderbird.nix
    ../modules/tmux.nix
    ../modules/virt-manager.nix
    ../modules/waybar.nix
    ../modules/yazi.nix
    ../modules/zoxide.nix
    ../modules/zsh.nix
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";
  home.file = {
    downloads.source = config.lib.file.mkOutOfStoreSymlink "/mnt/data/downloads";
    data.source = config.lib.file.mkOutOfStoreSymlink "/mnt/data";
    "pictures/wallpapers".source = ../../other/wallpapers;
  };

  home.packages = with pkgs; [
    # rice
    fastfetch
    cmatrix
    cava

    # desktop
    cliphist
    hyprland-autoname-workspaces
    hyprpicker
    inputs.hyprwm-contrib.packages.${pkgs.system}.grimblast
    pavucontrol
    swayidle
    swww
    wl-clipboard
    (import ../derivations/brightness.nix { inherit pkgs; })
    (import ../derivations/pavolume.nix { inherit pkgs; })
    (import ../derivations/swaylock.nix { inherit config custom pkgs; })

    # system utilities
    _7zz
    bandwhich
    compsize
    duf
    eza
    ffmpeg_6-full
    inputs.hsize.packages.${pkgs.system}.hsize
    jq
    nmap
    nvtop
    pv
    timg

    # graphical utilities
    brave
    firefox
    gimp
    qbittorrent
    ripdrag
    (discord-canary.override {
      withOpenASAR = true;
      withVencord = true;
    })

    # development utilities
    gcc
    python3
    python310Packages.bpython
    rustup
    virt-manager

    # games
    prismlauncher
    superTuxKart
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge

    # ABSOLUTELY PROPRIETARY
    zoom-us
  ];

  home.sessionVariables = {
    TERMINAL = "kitty";
    BROWSER = "firefox";
  };

  home.pointerCursor = {
    name = custom.pointerCursor.name;
    package = custom.pointerCursor.package;
    size = custom.pointerCursor.size;
    x11.enable = true;
    gtk.enable = true;
  };
}
