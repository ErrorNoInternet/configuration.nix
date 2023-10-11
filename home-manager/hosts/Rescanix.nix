{ config, inputs, pkgs, ... }:

let
  custom = {
    font = "JetBrainsMono Nerd Font";
    opacity = ".7";
    subtleOpacity = ".9";
    predefinedColorScheme = "Nord";
    pointerCursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 16;
    };
    gtkTheme = {
      name = "Colloid-Dark-${custom.predefinedColorScheme}";
      package = pkgs.colloid-gtk-theme.override { tweaks = [ "${lib.strings.toLower custom.predefinedColorScheme}" ]; };
    };
    gtkIconTheme = {
      name = "Colloid-${lib.strings.toLower custom.predefinedColorScheme}-dark";
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
    ../modules/imv.nix
    ../modules/kdeconnect.nix
    ../modules/kitty.nix
    ../modules/mpv.nix
    ../modules/neovim.nix
    ../modules/obs-studio.nix
    ../modules/rofi.nix
    ../modules/tmux.nix
    ../modules/waybar.nix
    ../modules/yazi.nix
    ../modules/zoxide.nix
    ../modules/zsh.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";

  home.packages = with pkgs; [
    (hashcat.override { cudaSupport = true; })
    (import ../../workstation/derivations/collect-hwinfo.nix { inherit pkgs; })
    (import ../../workstation/derivations/passgen.nix { inherit pkgs; })
    (import ../../workstation/derivations/tbw.nix { inherit pkgs; })
    (import ../derivations/brightness.nix { inherit pkgs; })
    (import ../derivations/pavolume.nix { inherit pkgs; })
    (import ../derivations/swaylock.nix { inherit config custom pkgs; })
    _7zz
    bandwhich
    blender
    brave
    cava
    cliphist
    cmatrix
    compsize
    cpu-x
    drm_info
    duf
    eza
    fastfetch
    ffmpeg_6-full
    firefox
    gcc
    geekbench
    gimp
    hyprland-autoname-workspaces
    hyprpicker
    inputs.hsize.packages.${pkgs.system}.hsize
    inputs.hyprwm-contrib.packages.${pkgs.system}.grimblast
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge
    intel-gpu-tools
    jq
    kdiskmark
    lm_sensors
    lshw
    mangohud
    mesa-demos
    nmap
    nvtop
    pavucontrol
    powertop
    prismlauncher
    pv
    python3
    radeontop
    ripdrag
    rustup
    slurp
    smartmontools
    sshfs
    superTuxKart
    swayidle
    swaylock-effects
    swww
    timg
    unigine-heaven
    vulkan-tools
    wf-recorder
    wl-clipboard
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
