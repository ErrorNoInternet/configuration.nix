{
  inputs',
  lib,
  pkgs,
  self',
  ...
}:
let
  inherit (lib) mkDefault mkForce;
in
{
  imports = [
    ./aerc.nix
    ./btop.nix
    ./irssi.nix
    ./yazi
  ];

  services = {
    mullvad-vpn.enable = mkDefault true;
  };

  programs = {
    fish = {
      enable = true;
      shellAliases = mkForce { };
    };

    fuse.userAllowOther = true;

    git = {
      enable = true;
      lfs.enable = true;
    };

    gnupg.agent.enable = true;

    ssh.startAgent = true;

    nix-index-database.comma.enable = true;

    nix-index = {
      enableBashIntegration = false;
      enableFishIntegration = false;
      enableZshIntegration = false;
    };

    nix-ld.enable = true;
  };

  environment.systemPackages = with pkgs; [
    python3
    (python3Packages.bpython.overrideAttrs (_old: {
      dontUsePytestCheck = true;
    }))
    python3Packages.btrfs

    (gcal.overrideAttrs (_old: {
      env.NIX_CFLAGS_COMPILE = "-std=gnu17";
    }))

    _7zz
    atop
    bat
    binsort
    btdu
    bubblewrap
    cachix
    cmatrix
    compsize
    copyparty
    croc
    deadnix
    delta
    difftastic
    dnsutils
    doggo
    duf
    dust
    evcxr
    eza
    fastfetch
    fd
    file
    gcc
    gnupg
    hdparm
    htop
    hyperfine
    inputs'.agenix.packages.default
    inputs'.disko.packages.default
    inputs'.nix-super.packages.default
    inxi
    jq
    jujutsu
    killall
    libqalculate
    lm_sensors
    lowfi
    lsof
    manix
    microfetch
    miniupnpc
    multipath-tools
    nb
    neovim
    nh
    nix-output-monitor
    nmap
    npins
    nvme-cli
    openssl
    pinentry-curses
    poop
    progress
    ripgrep
    screen
    self'.packages.dwarfs
    smartmontools
    squashfsTools
    statix
    sysstat
    tcpdump
    tmux
    translate-shell
    try
    tz
    vgrep
    vim
  ];
}
