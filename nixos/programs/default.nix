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
    atuin
    bandwhich
    bat
    binsort
    btdu
    bubblewrap
    cachix
    chawan
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
    efibootmgr
    eza
    fastfetch
    fd
    file
    gcc
    gnumake
    gnupg
    hdparm
    htop
    hwatch
    inputs'.agenix.packages.default
    inputs'.disko.packages.default
    inputs'.nix-alien.packages.default
    inputs'.nix-super.packages.default
    inxi
    jq
    jujutsu
    killall
    libqalculate
    lm_sensors
    lowfi
    lsof
    man-pages
    manix
    microfetch
    miniupnpc
    multipath-tools
    ncdu
    nh
    nix-output-monitor
    nmap
    npins
    nvme-cli
    openssl
    parted
    pciutils
    perf
    pinentry-curses
    poop
    procs
    progress
    pstree
    pv
    ripgrep
    s-tui
    screen
    self'.packages.dwarfs
    self'.packages.neovim
    smartmontools
    smem
    squashfsTools
    sshfs
    statix
    sysstat
    tcpdump
    tmux
    translate-shell
    try
    tz
    unzip
    vgrep
    vim
    whois
  ];
}
