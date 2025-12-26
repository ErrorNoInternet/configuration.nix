{
  inputs',
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./aerc.nix
    ./btop.nix
    ./irssi.nix
    ./yazi
  ];

  services = {
    mullvad-vpn.enable = true;
  };

  programs = {
    fish = {
      enable = true;
      shellAliases = lib.mkForce { };
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
  };

  environment.systemPackages = with pkgs; [
    _7zz
    atop
    bat
    binsort
    btdu
    cachix
    cmatrix
    compsize
    copyparty
    croc
    deadnix
    delta
    difftastic
    doggo
    duf
    dust
    dwarfs
    evcxr
    eza
    fastfetch
    fd
    file
    gcal
    gcc
    gnupg
    hdparm
    htop
    hyperfine
    inputs'.agenix.packages.default
    inputs'.disko.packages.default
    inputs'.nix-super.packages.default
    jq
    jujutsu
    killall
    libqalculate
    lm_sensors
    lowfi
    lsof
    microfetch
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
    python3
    python3Packages.bpython
    ripgrep
    screen
    smartmontools
    squashfsTools
    statix
    tmux
    translate-shell
    try
    vgrep
    vim
  ];
}
